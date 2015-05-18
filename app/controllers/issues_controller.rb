class IssuesController < ApplicationController
  include NestedUnderRepo
  include RequiresCurrentUser

  # GET /issues
  # GET /issues.json
  def index
    @members = repository_members
    @open_issues = open_issues
    @closed_issues = closed_issues
    @issues_data_series = IssuesDataSeries.new(
      @open_issues + @closed_issues,
      since,
      0.days.ago
    )
  end

  private

  def current_github_username
    params[:username] || current_user_github_username
  end

  def since
    return 1.days.ago unless params.has_key? :since

    Time.parse params[:since]
  end

  def open_issues
    scoped_members_names.flat_map do |member_name|
      Github::Issue.organization_issues current_user_github_access_token,
      current_repository_full_name,
      assignee: member_name,
      sort: "updated",
      state: "open"
    end
  end

  def closed_issues
    scoped_members_names.flat_map do |member_name|
      Github::Issue.organization_issues current_user_github_access_token,
        current_repository_full_name,
        assignee: member_name,
        sort: "updated",
        since: since.iso8601.to_s,
        state: "closed"
    end
  end

  def repository_members
    @repository_members ||= Github::Repo.repository_assignees current_user_github_access_token,
      current_repository_full_name
  end

  def scoped_members_names
    if params[:username]
      [current_github_username]
    else
      repository_members.map &:login
    end
  end

end
