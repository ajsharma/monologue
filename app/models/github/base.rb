module Github
  class Base

    attr_reader :github_access_token, :github_api_client

    def initialize github_access_token
      @github_access_token = github_access_token
      @github_api_client ||= Octokit::Client.new access_token: github_access_token
    end

    def method_missing method, *args
      github_api_client.send method, *args
    end

  end
end
