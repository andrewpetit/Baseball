# frozen_string_literal: true

class FantasyBaseballRosterMember < ApplicationRecord
  belongs_to :fantasy_baseball_roster

  attr_accessor :season_rank, :original_rank, :player_stats, :season_stat_rank, :playing_today

  def name_number_team
    "#{full_name}\n#{team_with_number}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def team_with_number
    "##{uniform_number} #{editorial_team_full_name}"
  end
end
