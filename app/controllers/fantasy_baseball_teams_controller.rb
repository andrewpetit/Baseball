class FantasyBaseballTeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fantasy_baseball_team, only: [:show, :edit, :update, :update_roster, :destroy]

  # GET /fantasy_baseball_teams
  def index
    redirect_to add_fantasy_baseball_teams_path if current_user.fantasy_baseball_team.empty?
    @fantasy_baseball_teams = current_user.fantasy_baseball_team
  end

  #
  # GET /fantasy_baseball_teams/1
  def show
    team = @fantasy_baseball_team.fantasy_baseball_roster.find(params[:update_id]) if params[:update_id]
    @roster = if team.present?
                @updated = team.created_at
                team.fantasy_baseball_roster_member
              else
                @fantasy_baseball_team.current_roster
              end
    @roster = DisplaySort.sort @roster
  end

  # GET /fantasy_baseball_teams/new
  def new
    yahoo_id = params[:id]
    @fantasy_baseball_team = current_user.team_from_yahoo yahoo_id
  end

  # GET /fantasy_baseball_teams/1/edit
  def edit; end

  # POST /fantasy_baseball_teams
  def create
    @fantasy_baseball_team = FantasyBaseballTeam.new(fantasy_baseball_team_params)
    @fantasy_baseball_team.user = current_user

    respond_to do |format|
      if @fantasy_baseball_team.save
        format.html { redirect_to @fantasy_baseball_team, notice: 'Fantasy baseball team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /fantasy_baseball_teams/1
  def update
    respond_to do |format|
      if @fantasy_baseball_team.update(fantasy_baseball_team_params)
        format.html { redirect_to @fantasy_baseball_team, notice: 'Fantasy baseball team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /fantasy_baseball_teams/1
  def update_roster
    respond_to do |format|
      manual = UpdateType.find_by(update_type: UpdateType::MANUAL)
      if @fantasy_baseball_team.update_roster manual
        format.html { redirect_to @fantasy_baseball_team, notice: 'Fantasy baseball team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /fantasy_baseball_teams/1
  def destroy
    @fantasy_baseball_team.destroy
    respond_to do |format|
      format.html { redirect_to fantasy_baseball_teams_url, notice: 'Fantasy baseball team was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fantasy_baseball_team
    @fantasy_baseball_team = current_user.fantasy_baseball_team.find_by_id(params[:id])
    redirect_to fantasy_baseball_teams_path if @fantasy_baseball_team.nil?
  end

  def fantasy_baseball_team_params
    params.require(:fantasy_baseball_team)
          .permit(:league_key,
                  :league_id,
                  :team_id,
                  :roster_sort_id,
                  :team_name,
                  :league_name,
                  :is_active,
                  :season,
                  :auto_update,
                  :team_icon_url)
  end
end
