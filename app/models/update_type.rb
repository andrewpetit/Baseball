class UpdateType < ApplicationRecord
  has_many :fantasy_baseball_roster

  MANUAL = 'Manual'.freeze
  AUTO = 'Auto'.freeze
end
