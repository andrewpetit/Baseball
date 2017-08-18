require 'rails_helper'

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

  # [{"rank_type"=>["OR"], "rank_value"=>["78"]}, {"rank_type"=>["S"], "rank_value"=>["303"], "rank_season"=>["2017"]}]
  let(:rank1) do
    build :fantasy_baseball_roster_member,
          position_type: 'B',
          selected_position: 'C',
          player_ranks: [{ 'rank_type' => ['OR'], 'rank_value' => ['1'] }, { 'rank_type' => ['S'], 'rank_value' => ['1'], 'rank_season' => ['2017'] }],
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
          player_ranks: [{ 'rank_type' => ['OR'], 'rank_value' => ['2'] }, { 'rank_type' => ['S'], 'rank_value' => ['2'], 'rank_season' => ['2017'] }],
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
          player_ranks: [{ 'rank_type' => ['OR'], 'rank_value' => ['3'] }, { 'rank_type' => ['S'], 'rank_value' => ['3'], 'rank_season' => ['2017'] }],
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
          player_ranks: [{ 'rank_type' => ['OR'], 'rank_value' => ['4'] }, { 'rank_type' => ['S'], 'rank_value' => ['4'], 'rank_season' => ['2017'] }],
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
        expect(ranks[0].updated_position).to eq 'C'
        expect(ranks[1].updated_position).to eq 'SS'
        expect(ranks[2].updated_position).to eq 'SP'
        expect(ranks[3].updated_position).to eq 'P'
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
        expect(ranks[0].updated_position).to eq 'C'
        expect(ranks[1].updated_position).to eq 'SS'
        expect(ranks[2].updated_position).to eq 'SP'
        expect(ranks[3].updated_position).to eq 'P'
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
        expect(ranks[0].updated_position).to eq 'C'
        expect(ranks[1].updated_position).to eq 'SS'
        expect(ranks[2].updated_position).to eq 'SP'
        expect(ranks[3].updated_position).to eq 'P'
      end
    end
  end
end
