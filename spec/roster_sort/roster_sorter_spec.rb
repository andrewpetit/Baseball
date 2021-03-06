# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe RosterSorter, type: :class do
  let(:roster_sorter) { described_class.new(fantasy_baseball_team) }
  let(:fantasy_baseball_team) { build :fantasy_baseball_team, roster_sort: roster_sort }
  let(:roster_sort) { build :roster_sort, sort_type: sort_type, description: junk }
  let(:sort_type) { 'season_rank' }
  let(:hitter_positions) { ['C', 'SS'] }
  let(:pitcher_positions) { ['SP', 'P'] }
  let(:player1) do
    build :fantasy_baseball_roster_member,
          editorial_team_full_name: 'Cleveland Indians',
          position_type: 'B',
          selected_position: 'SS',
          eligible_positions: ['C', 'SS']
  end
  let(:player2) do
    build :fantasy_baseball_roster_member,
          editorial_team_full_name: 'Cleveland Indians',
          position_type: 'B',
          selected_position: 'C',
          eligible_positions: ['C', 'SS']
  end
  let(:player3) do
    build :fantasy_baseball_roster_member,
          editorial_team_full_name: 'Cleveland Indians',
          position_type: 'P',
          selected_position: 'P',
          eligible_positions: ['SP', 'P']
  end
  let(:player4) do
    build :fantasy_baseball_roster_member,
          editorial_team_full_name: 'Cleveland Indians',
          position_type: 'P',
          selected_position: 'SP',
          eligible_positions: ['SP', 'P']
  end
  let(:roster) do
    [player1, player2, player3, player4]
  end

  let(:rank1) do
    build :fantasy_baseball_roster_member,
          position_type: 'B',
          selected_position: 'C',
          original_rank: 1,
          season_rank: 1,
          player_stats: { '7' => '45',
                          '8' => '113',
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
          original_rank: 2,
          season_rank: 2,
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
          original_rank: 3,
          season_rank: 3,
          player_stats: { '7' => '45',
                          '8' => '113',
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
          original_rank: 4,
          season_rank: 4,
          player_stats: { '7' => '45',
                          '8' => '113',
                          '12' => '6',
                          '13' => '40',
                          '16' => '1',
                          '21' => '51',
                          '3' => '.265',
                          '4' => '.345' }
  end
  let(:ranks) do
    [rank1, rank2, rank3, rank4]
  end
  let(:todays_games) { [{ team: 'Cleveland Indians' }] }
  let(:seat_geek) { instance_double(Api::SeatGeekGames, todays_games: todays_games) }

  before do
    allow(fantasy_baseball_team).to receive(:current_roster).and_return(roster)
    allow(fantasy_baseball_team).to receive(:current_ranks).and_return(ranks)
    allow(fantasy_baseball_team).to receive(:current_stats).and_return(ranks)
    allow(Api::SeatGeekGames).to receive(:new).and_return(seat_geek)
  end

  describe '#available_hitter_positions' do
    it 'returns array of positions' do
      expect(roster_sorter.available_hitter_positions).to eq hitter_positions
    end
  end

  describe '#available_pitcher_positions' do
    it 'returns array of positions' do
      expect(roster_sorter.available_pitcher_positions).to eq pitcher_positions
    end
  end

  describe '#sorted_roster' do
    context 'with season_rank' do
      it 'updates position' do
        roster_sorter.sorted_roster.each do |player|
          expect(player.updated_position).not_to be_empty
        end
      end

      it 'sorts position' do
        ranks = roster_sorter.sorted_roster
        expect(ranks[0].updated_position).to eq 'SS'
        expect(ranks[1].updated_position).to eq 'C'
        expect(ranks[2].updated_position).to eq 'P'
        expect(ranks[3].updated_position).to eq 'SP'
      end
    end

    context 'with original_rank' do
      let(:sort_type) { 'original_rank' }

      it 'updates position' do
        roster_sorter.sorted_roster.each do |player|
          expect(player.updated_position).not_to be_empty
        end
      end

      it 'sorts position' do
        ranks = roster_sorter.sorted_roster
        expect(ranks[0].updated_position).to eq 'SS'
        expect(ranks[1].updated_position).to eq 'C'
        expect(ranks[2].updated_position).to eq 'P'
        expect(ranks[3].updated_position).to eq 'SP'
      end
    end

    context 'with season_stat_rank' do
      let(:sort_type) { 'season_stat_rank' }

      it 'updates position' do
        roster_sorter.sorted_roster.each do |player|
          expect(player.updated_position).not_to be_empty
        end
      end

      it 'sorts position' do
        ranks = roster_sorter.sorted_roster
        expect(ranks[0].updated_position).to eq 'SS'
        expect(ranks[1].updated_position).to eq 'C'
        expect(ranks[2].updated_position).to eq 'P'
        expect(ranks[3].updated_position).to eq 'SP'
      end
    end

    context 'when status_full is present' do
      let(:status_full) { junk }

      before do
        player1.status_full = status_full
      end

      it 'updates position' do
        expect(roster_sorter.sorted_roster.select { |p| p.status_full == status_full }.first.updated_position).to eq 'SS'
      end
    end

    context 'when probable_starter' do
      before do
        player2.probable_starter = true
      end

      it 'updates position' do
        expect(roster_sorter.sorted_roster.select { |p| p.probable_starter == true }.first.updated_position).to eq 'C'
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
