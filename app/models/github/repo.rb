module Github
  class Repo < Base

    def repositories github_user_name, options = {}
      @repos = github_api_client.repositories github_user_name, options
    end

    def self.repositories github_access_token, github_user_name, options = {}
      self.new( github_access_token ).repositories github_user_name, options
    end

  end
end
