# frozen_string_literal: true

class UpdateType < ApplicationRecord
  has_many :fantasy_baseball_roster

  MANUAL = 'Manual'
  AUTO = 'Auto'
end
