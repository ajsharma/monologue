class GithubEventsController < ApplicationController
  before_action :set_github_event, only: [:show, :edit, :update, :destroy]

  # GET /github_events
  # GET /github_events.json
  def index
    @github_events = []
  end

  # GET /github_events/1
  # GET /github_events/1.json
  def show
  end

  private

    def github_api_client
      client = Octokit::Client.new(:login => 'defunkt', :password => 'c0d3b4ssssss!')
    end
end
