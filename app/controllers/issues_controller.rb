class IssuesController < ApplicationController
  include NestedUnderRepo

  # GET /issues
  # GET /issues.json
  def index
    @open_issues = Github::Issue.organization_issues current_user_github_access_token,
      current_repository_full_name,
      assignee: current_github_username,
      sort: "updated",
      state: "open"

    @closed_issues = Github::Issue.organization_issues current_user_github_access_token,
      current_repository_full_name,
      assignee: current_github_username,
      sort: "updated",
      since: 1.days.ago.iso8601.to_s,
      state: "closed"
  end

end
