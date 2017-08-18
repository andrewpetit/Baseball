class FantasyBaseballRostersController < ApplicationController
  before_action :authenticate_user!

  # GET /fantasy_baseball_rosters
  def index
    @fantasy_baseball_team = current_user.fantasy_baseball_team.find_by_id(params[:fantasy_baseball_team_id])
    @fantasy_baseball_rosters = @fantasy_baseball_team.try(:fantasy_baseball_roster)
    @fantasy_baseball_rosters = @fantasy_baseball_rosters.order('created_at desc') if @fantasy_baseball_rosters
  end

end
