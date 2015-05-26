class IssuesSearch
  include ActiveModel::Model

  attr_accessor(
    :github_access_token,
    :repository_full_name,
    :scoped_members_names
  )

  attr_writer :since

  validates :since, date: true

  def initialize(attributes = {})
    super
    @since ||= 1.days.ago.to_s
  end

  def open_issues
    @open_issues ||= begin
      scoped_members_names.flat_map do |member_name|
        Github::Issue.organization_issues(
          github_access_token,
          repository_full_name,
          assignee: member_name,
          sort: "updated",
          state: "open"
        )
      end
    end
  end

  def closed_issues
    @closed_issues ||= begin
      scoped_members_names.flat_map do |member_name|
        Github::Issue.organization_issues(
          github_access_token,
          repository_full_name,
          assignee: member_name,
          sort: "updated",
          since: since.iso8601,
          state: "closed"
        )
      end
    end
  end

  def since
    Date.parse(@since)
  rescue ArgumentError
    1.days.ago
  end
end
