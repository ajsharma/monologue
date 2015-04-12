module Github
  class Org < Base

    def orgs github_user_name, options = {}
      @repos = github_api_client.orgs github_user_name, options
    end

    def self.orgs github_access_token, github_user_name, options = {}
      self.new( github_access_token ).orgs github_user_name, options
    end

  end
end
