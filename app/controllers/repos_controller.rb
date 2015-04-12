class ReposController < ApplicationController

  # GET /repos
  # GET /repos.json
  def index
    @repos ||= begin
      if user_signed_in?
        Github::Repo.repositories current_user_github_access_token,
          current_github_username
      else
        []
      end
    end
  end

end
