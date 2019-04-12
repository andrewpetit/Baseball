# frozen_string_literal: true

class RosterSorter

  HITTER_POSITION_PRECEDENTS =
    { 'C' => 1,
      '1B' => 2,
      '2B' => 3,
      '3B' => 4,
      'SS' => 5,
      'OF' => 6,
      'Util' => 7,
      'BN' => 8 }.freeze

  PITCHER_POSITION_PRECEDENTS =
    { 'RP' => 1,
      'SP' => 2,
      'P' => 3,
      'BN' => 4 }.freeze

  # TODO: include these in update
  REJECTED_POSITIONS = ['DL', 'NA'].freeze

  def initialize fantasy_baseball_team
    @fantasy_baseball_team = fantasy_baseball_team
    @fantasy_baseball_roster = fantasy_baseball_team.current_roster.reject { |p| REJECTED_POSITIONS.include?(p.selected_position) }
    @roster_sort = fantasy_baseball_team.roster_sort
  end

  def available_hitter_positions
    @available_hitter_positions ||= hitters
                                    .map(&:selected_position)
                                    .sort_by { |pos| HITTER_POSITION_PRECEDENTS[pos] }
  end

  def available_pitcher_positions
    @available_pitcher_positions ||= pitchers
                                     .map(&:selected_position)
                                     .sort_by { |pos| PITCHER_POSITION_PRECEDENTS[pos] }
  end

  def sorted_roster
    merge_sort_data
    merge_playing_today
    sort
    DisplaySort.sort @fantasy_baseball_roster
  end

  private

  def sort
    @fantasy_baseball_roster = @fantasy_baseball_roster
                               .sort_by { |r| r.send(@roster_sort.sort_type.to_s) }
                               .sort_by { |p| p.playing_today ? 0 : 1 }
                               .sort_by { |p| p.probable_starter ? 0 : 1 }
                               .sort_by { |p| p.status_full.present? ? 1 : 0 }
    sort_hitters
    sort_pitchers
  end

  def hitters
    @fantasy_baseball_roster.select { |p| p.position_type == 'B' }
  end

  def pitchers
    @fantasy_baseball_roster.select { |p| p.position_type == 'P' }
  end

  def sort_hitters
    available_hitter_positions.each do |pos|
      if hitters.find { |p| (p.eligible_positions.include?(pos) || pos == 'BN') && p.updated_position.empty? }.present?
        hitters.find { |p| (p.eligible_positions.include?(pos) || pos == 'BN') && p.updated_position.empty? }.updated_position = pos
      end
    end
  end

  def sort_pitchers
    available_pitcher_positions.each do |pos|
      if pitchers.find { |p| (p.eligible_positions.include?(pos) || pos == 'BN') && p.updated_position.empty? }.present?
        pitchers.find { |p| (p.eligible_positions.include?(pos) || pos == 'BN') && p.updated_position.empty? }.updated_position = pos
      end
    end
  end

  def merge_sort_data
    if @roster_sort.sort_type == 'season_stat_rank'
      merge_stats
    else
      merge_ranks
    end
  end

  def merge_ranks
    ranks = @fantasy_baseball_team.current_ranks
    @fantasy_baseball_roster.each do |player|
      player.original_rank = ranks.find { |p| p.editorial_player_key == player.editorial_player_key }.original_rank
      player.season_rank = ranks.find { |p| p.editorial_player_key == player.editorial_player_key }.season_rank
    end
  end

  def merge_stats
    stats = @fantasy_baseball_team.current_stats
    @fantasy_baseball_roster.each do |player|
      player.player_stats = stats.find { |p| p.editorial_player_key == player.editorial_player_key }.player_stats
    end
    @fantasy_baseball_roster = StatRanks.new(@fantasy_baseball_roster).rank_by_stats
  end

  def merge_playing_today
    games = Api::SeatGeekGames.new.todays_games.map { |t| t[:team] }
    @fantasy_baseball_roster.each do |player|
      player.playing_today = games.include?(player.editorial_team_full_name)
    end
  end

end
