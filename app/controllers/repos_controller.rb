class ReposController < ApplicationController

  # GET /repos
  # GET /repos.json
  def index
    @repos ||= begin
      if user_signed_in?
        Github::Repo.organization_repositories current_user_github_access_token,
          params[:org]
      else
        []
      end
    end
  end

end
