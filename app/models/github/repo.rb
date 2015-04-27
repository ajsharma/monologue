module Github
  class Repo < Base

    def self.organization_repositories github_access_token, repo_name, options = {}
      new( github_access_token ).organization_repositories repo_name, options
    end

    def self.repository_assignees github_access_token, repo_name, options = {}
      new( github_access_token ).repository_assignees repo_name, options
    end

  end
end
