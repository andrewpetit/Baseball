module Add
  class FantasyBaseballTeamsController < ApplicationController
    before_action :authenticate_user!

    # GET /fantasy_baseball_teams/auth_account
    def auth_account
      redirect_to(YahooAccessToken.auth_url(add_fantasy_baseball_teams_set_access_token_url))
    end

    # GET /fantasy_baseball_teams/set_access_token
    def set_access_token
      code = params[:code]
      current_user.yahoo_access_token ||= YahooAccessToken.new
      respond_to do |format|
        if current_user.yahoo_access_token.access_token_set code
          format.html { redirect_to add_fantasy_baseball_teams_path, notice: 'Yahoo Account Authenticated Successfully' }
        else
          format.html { redirect_to add_fantasy_baseball_teams_path, error: 'Yahoo Account Authorization Error' }
        end
      end
    end

    # GET /add/fantasy_baseball_teams
    def index
      return @fantasy_baseball_teams = {} unless current_user.yahoo_auth?

      @fantasy_baseball_teams = current_user.unadded_teams
    end
  end
end
