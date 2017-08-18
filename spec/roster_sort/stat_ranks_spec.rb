require 'rails_helper'

RSpec.describe StatRanks, type: :class do
  let(:stat_ranks) { described_class.new(roster_ranks) }

  let(:rank1) do
    build :fantasy_baseball_roster_member,
          position_type: 'B',
          selected_position: 'C',
          player_stats: { '7' => '45',
                          '8' => '112',
                          '12' => '6',
                          '13' => '40',
                          '16' => '1',
                          '21' => '51',
                          '3' => '.265',
                          '4' => '.345' }
  end

  let(:rank2) do
    build :fantasy_baseball_roster_member,
          position_type: 'B',
          selected_position: 'SS',
          player_stats: { '7' => '45',
                          '8' => '113',
                          '12' => '6',
                          '13' => '40',
                          '16' => '1',
                          '21' => '51',
                          '3' => '.265',
                          '4' => '.345' }
  end
  let(:rank3) do
    build :fantasy_baseball_roster_member,
          position_type: 'P',
          selected_position: 'SP',
          player_stats: { '7' => '45',
                          '8' => '114',
                          '12' => '6',
                          '13' => '40',
                          '16' => '1',
                          '21' => '51',
                          '3' => '.265',
                          '4' => '.345' }
  end
  let(:rank4) do
    build :fantasy_baseball_roster_member,
          position_type: 'P',
          selected_position: 'P',
          player_stats: { '7' => '45',
                          '8' => '115',
                          '12' => '6',
                          '13' => '40',
                          '16' => '1',
                          '21' => '51',
                          '3' => '.265',
                          '4' => '.345' }
  end
  let(:roster_ranks) do
    [rank1, rank2, rank3, rank4]
  end

  describe '#rank_by_stats' do
    let(:rank_by_stats) { stat_ranks.rank_by_stats }

    it 'sets season_stat_rank' do
      rank_by_stats.each do |player|
        expect(player.season_stat_rank).to be > 0
      end
    end

    it 'sorts by season_stat_rank' do
      expect(rank_by_stats).to eq rank_by_stats.sort_by(&:season_stat_rank)
    end
  end
end
