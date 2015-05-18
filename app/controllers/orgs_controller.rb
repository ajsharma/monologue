class OrgsController < ApplicationController
  include NestedUnderRepo
  include RequiresCurrentUser

  # GET /orgs
  # GET /orgs.json
  def index
    @orgs ||= Github::Org.orgs(
      current_user_github_access_token,
      current_github_username
    )
  end

end
