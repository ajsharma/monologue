class OrgsController < ApplicationController
  include NestedUnderRepo
  include RequiresCurrentUser

  # GET /orgs
  # GET /orgs.json
  def index
    @orgs ||= begin
      if user_signed_in?
        Github::Org.orgs current_user_github_access_token,
          current_github_username
      else
        []
      end
    end
  end

end
