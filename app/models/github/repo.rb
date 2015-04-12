module Github
  class Repo < Base

    def organization_repositories repo_name, options = {}
      @repos = github_api_client.organization_repositories repo_name, options
    end

    def self.organization_repositories github_access_token, repo_name, options = {}
      self.new( github_access_token ).organization_repositories repo_name, options
    end

  end
end
