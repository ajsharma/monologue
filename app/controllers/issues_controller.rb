class IssuesController < ApplicationController
  include NestedUnderRepo
  include RequiresCurrentUser

  # GET /issues
  # GET /issues.json
  def index
    @members = repository_members
    @issues_search = IssuesSearch.new(
      default_issues_search_params.merge issues_search_params
    )

    if @issues_search.valid?
      @issues_data_series = IssuesDataSeries.new(
        @issues_search.open_issues + @issues_search.closed_issues,
        @issues_search.since,
        0.days.ago
      )
    end
  end

  private

  def issues_search_params
    params.permit(issues_search: [:since])[:issues_search] || {}
  end

  def default_issues_search_params
    {
      github_access_token: current_user_github_access_token,
      repository_full_name: current_repository_full_name,
      scoped_members_names: scoped_members_names,
    }
  end

  def current_github_username
    params[:username] || current_user_github_username
  end

  def repository_members
    @repository_members ||= Github::Repo.repository_assignees(
      current_user_github_access_token,
      current_repository_full_name
    )
  end

  def scoped_members_names
    if params[:username]
      [current_github_username]
    else
      repository_members.map &:login
    end
  end

end
