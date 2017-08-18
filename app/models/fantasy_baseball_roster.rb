class FantasyBaseballRoster < ApplicationRecord
  belongs_to :fantasy_baseball_team
  belongs_to :roster_sort
  belongs_to :update_type
  has_many :fantasy_baseball_roster_member
end
