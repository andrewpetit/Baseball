# frozen_string_literal: true

class DisplaySort

  DISPLAY_ORDER =
    { 'C' => 1,
      '1B' => 2,
      '2B' => 3,
      '3B' => 4,
      'SS' => 5,
      'OF' => 6,
      'Util' => 7,
      'SP' => 8,
      'RP' => 10,
      'P' => 11,
      'BN' => 12,
      'DL' => 13 }.freeze

  def self.sort fantasy_baseball_roster
    fantasy_baseball_roster.sort_by { |rm| DISPLAY_ORDER[rm.selected_position] }
  end
end
