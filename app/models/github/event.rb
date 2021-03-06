module Github
  class Event < Base

    def user_events github_username
      @user_events ||= {}
      @user_events[ github_username ] ||= begin
        events = []
        for page in 1..3 do
          events.concat( github_api_client.user_events( github_username, page: page ) )
        end
        events.reverse! # make newest to oldest
        events
      end
    end

    def user_events_by_day github_username
      user_events_by_day = user_events( github_username ).group_by do |event|
        event.created_at.in_time_zone( ENV[ 'TIME_ZONE' ] ).to_date
      end
      user_events_by_day
    end

    def self.user_events_by_day github_access_token, github_username
      new( github_access_token ).user_events_by_day github_username
    end

    def organization_events github_username, github_organization
      events = github_api_client.organization_events github_organization
      events.select { |event| github_username.casecmp( event.actor.login ).zero? }
    end

    def organization_events_by_day github_username, github_organization
      organization_events( github_username, github_organization ).group_by{ |event| event.created_at.to_date }
    end

    def self.organization_events_by_day github_access_token, github_username, github_organization
      new( github_access_token ).organization_events_by_day github_username, github_organization
    end

  end
end
