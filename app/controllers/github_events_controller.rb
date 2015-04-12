class GithubEventsController < ApplicationController
  include NestedUnderRepo

  # GET /github_events
  # GET /github_events.json
  def index
    @github_events_by_date ||= begin
      if user_signed_in?
        Github::Event.user_events_by_day current_user_github_access_token,
          current_user_github_username
      else
        []
      end
    end
  end

  # GET /github_events/1
  # GET /github_events/1.json
  def show
  end

end
