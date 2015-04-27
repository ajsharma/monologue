module Github
  class Org < Base

    def self.orgs github_access_token, github_user_name, options = {}
      new( github_access_token ).orgs github_user_name, options
    end

    def self.members github_access_token, org, options = {}
      new( github_access_token ).members org, options
    end

  end
end
