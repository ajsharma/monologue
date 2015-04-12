module Github
  class Issue

    attr_reader :github_access_token

    def initialize github_access_token
      @github_access_token = github_access_token
    end

    def user_issues github_username
      @user_issues ||= {}
      @user_issues[ github_username ] ||= begin
        issues = []
        for page in 1..3 do
          issues.concat( github_api_client.user_issues( github_username, page: page ) )
        end
        issues.reverse! # make newest to oldest
        issues
      end
    end

    def user_issues_by_day github_username
      user_issues_by_day = user_issues( github_username ).group_by do |issue|
        issue.created_at.in_time_zone( ENV[ 'TIME_ZONE' ] ).to_date
      end
      user_issues_by_day
    end

    def self.user_issues_by_day github_access_token, github_username
      self.new( github_access_token ).user_issues_by_day github_username
    end

    def organization_issues github_repository, options = {}
      issues = github_api_client.list_issues github_repository, options
    end

    def self.organization_issues github_access_token, github_repository, options = {}
      self.new( github_access_token ).organization_issues github_repository, options
    end

    def organization_issues_by_day github_username, github_organization
      organization_issues( github_username, github_organization ).group_by{ |issue| issue.created_at.to_date }
    end

    def self.organization_issues_by_day github_access_token, github_username, github_organization
      self.new( github_access_token ).organization_issues_by_day github_username, github_organization
    end

    private

    def github_api_client
      @github_api_client ||= Octokit::Client.new access_token: github_access_token
    end

  end
end
