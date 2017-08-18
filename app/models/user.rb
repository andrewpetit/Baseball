class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :yahoo_access_token
  has_many :fantasy_baseball_team

  def yahoo_auth?
    yahoo_access_token.present?
  end

  def team_from_yahoo yahoo_id
    return {} unless yahoo_auth?
    unadded_teams.select { |t| t.league_key == yahoo_id }.first
  end

  def unadded_teams
    return {} unless yahoo_auth?
    current_teams = fantasy_baseball_team.map(&:league_key)
    teams_api = Api::YahooTeam.new yahoo_access_token
    teams_api.user_teams.reject { |t| current_teams.include? t.league_key }
  end

  def deactivate_leagues
    return unless yahoo_auth?
    update_teams = fantasy_baseball_team.reject { |t| t.is_active == false }
    return if update_teams.empty?
    teams_api = Api::YahooTeam.new yahoo_access_token
    update_teams.each do |team|
      team.is_active = teams_api.user_teams.find { |t| team.league_key == t.league_key }
      team.save
    end
  end
end
