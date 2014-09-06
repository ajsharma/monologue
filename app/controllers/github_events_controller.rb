class GithubEventsController < ApplicationController
  before_action :set_github_event, only: [:show, :edit, :update, :destroy]

  # GET /github_events
  # GET /github_events.json
  def index
    @github_events = user_signed_in? ? github_api_client.user_events( current_user_github_username ) : []
  end

  # GET /github_events/1
  # GET /github_events/1.json
  def show
  end

  private

  def github_api_client
    @github_api_client ||= Octokit::Client.new access_token: current_user.github_access_token
  end

  def current_user_github_username
    current_user.github_username
  end

end
