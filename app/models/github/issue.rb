module Github
  class Issue < Base

    def organization_issues github_repository, options = {}
      issues = github_api_client.list_issues github_repository, options
    end

    def self.organization_issues github_access_token, github_repository, options = {}
      self.new( github_access_token ).organization_issues github_repository, options
    end

  end
end
