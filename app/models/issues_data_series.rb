class IssuesDataSeries
  attr_reader :open_issues, :closed_issues

  def initialize(open_issues, closed_issues)
    @open_issues = open_issues
    @closed_issues = closed_issues
  end

  def series
    [
      {
        name: "Open Issues",
        data: {
          1.day.ago => open_issues.count + closed_issues.count,
          0.days.ago => open_issues.count,
        }
      }
    ]
  end
end
