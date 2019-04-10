# frozen_string_literal: true

class RosterSort < ApplicationRecord
  has_many :fantasy_baseball_team
  has_many :fantasy_baseball_roster

  SEASON_RANK = 'season_rank'
  SEASON_STAT_RANK = 'season_stat_rank'
  ORIGINAL_RANK = 'original_rank'

end
