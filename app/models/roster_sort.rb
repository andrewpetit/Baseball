class RosterSort < ApplicationRecord
  has_many :fantasy_baseball_team
  has_many :fantasy_baseball_roster

  SEASON_RANK = 'season_rank'.freeze
  SEASON_STAT_RANK = 'season_stat_rank'.freeze
  ORIGINAL_RANK = 'original_rank'.freeze

end
