class IssuesDataSeries
  attr_reader :issues, :starts_at, :ends_at

  def initialize(issues, starts_at, ends_at)
    @issues = issues
    @starts_at = starts_at
    @ends_at = ends_at
  end

  def series
    [
      {
        name: "Open Issues",
        data: data
      }
    ]
  end

  protected

  def data
    d = {}

    time = starts_at
    begin
      d[time] = issues.count do |issue|
        issue.closed_at.nil? || (issue.closed_at > time)
      end
    end while (time += 3600) < ends_at

    d
  end
end
