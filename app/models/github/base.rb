module Github
  class Base

    attr_reader :github_access_token

    def initialize github_access_token
      @github_access_token = github_access_token
    end

    protected

    def github_api_client
      @github_api_client ||= Octokit::Client.new access_token: github_access_token
    end

  end
end
