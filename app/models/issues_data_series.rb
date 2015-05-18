class IssuesDataSeries
  attr_reader :issues, :starts_at, :ends_at

  def initialize(issues, starts_at, ends_at)
    @issues = issues
    @starts_at = starts_at
    @ends_at = ends_at
  end

  def series
    @series ||= begin
      milestone_titles.map do |milestone_title|
        {
          name: milestone_title || "No milestone",
          data: milestone_data(milestone_title)
        }
      end
    end
  end

  protected

  def milestone_titles
    @milestone_titles ||= issues.map { |i| i.milestone.try(:title) }.uniq
  end

  def closing_times
    @closing_times ||= begin
      (issues.map(&:closed_at) + [starts_at, ends_at]).uniq.reject(&:nil?)
    end
  end

  def milestone_data(milestone_title)
    d = {}
    closing_times.each do |closing_time|
      d[closing_time] = issues.count do |issue|
        (issue.milestone.try(:title) == milestone_title) &&
        (issue.closed_at.nil? || (issue.closed_at > closing_time))
      end
    end
    d
  end
end
