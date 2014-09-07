class GithubEvent

  attr_reader :github_access_token

  def initialize github_access_token
    @github_access_token = github_access_token
  end

  def user_events github_username
    github_api_client.user_events github_username
  end

  def user_events_by_day github_username
    user_events( github_username ).group_by{ |event| event.created_at.to_date }
  end

  def self.user_events_by_day github_access_token, github_username
    self.new( github_access_token ).user_events_by_day github_username
  end

  def organization_events github_username, github_organization
    events = github_api_client.organization_events github_organization
    events.select { |event| github_username.casecmp( event.actor.login ).zero? }
  end

  def organization_events_by_day github_username, github_organization
    organization_events( github_username, github_organization ).group_by{ |event| event.created_at.to_date }
  end

  def self.organization_events_by_day github_access_token, github_username, github_organization
    self.new( github_access_token ).organization_events_by_day github_username, github_organization
  end

  private

  def github_api_client
    @github_api_client ||= Octokit::Client.new access_token: github_access_token
  end

end
