# frozen_string_literal: true

class FantasyBaseballTeam < ApplicationRecord
  belongs_to :user
  belongs_to :roster_sort
  has_many :fantasy_baseball_roster, -> { order(created_at: :desc) }

  def initialize args = nil
    unless args.nil?
      args = args.select { |a| FantasyBaseballTeam.attribute_names.index(a) }
    end
    super
  end

  def self.optimizable_leagues
    FantasyBaseballTeam.where(is_active: true, auto_update: true)
  end

  def mlb_id
    league_key.split('.').first
  end

  def current_roster
    Api::YahooRoster.new(user.yahoo_access_token, league_key, team_id).current_roster_members
  end

  def current_ranks
    Api::YahooRanks.new(user.yahoo_access_token, mlb_id, league_key, current_roster.map(&:editorial_player_key)).current_player_ranks
  end

  def current_stats
    Api::YahooStats.new(user.yahoo_access_token, mlb_id, league_key, current_roster.map(&:editorial_player_key)).current_player_stats
  end

  def sorted_roster
    RosterSorter.new(self).sorted_roster
  end

  def update_roster update_type
    return unless is_active

    Api::YahooRosterUpdate.new(self, user.yahoo_access_token).update_roster update_type
  end

end
