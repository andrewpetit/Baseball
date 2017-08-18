class FantasyBaseballRosterMember < ApplicationRecord
  belongs_to :fantasy_baseball_roster

  attr_accessor :player_ranks, :player_stats, :season_stat_rank, :playing_today

  def initialize args = nil
    unless args.nil?
      @player_ranks = args['player_ranks']
      @player_stats = args['player_stats']
      @season_stat_rank = 0
      @playing_today = false
      args.select! { |a| FantasyBaseballRosterMember.attribute_names.index(a) }
    end
    super
  end

  def name_number_team
    "#{full_name}\n#{team_with_number}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def team_with_number
    "##{uniform_number} #{editorial_team_full_name}"
  end

  def season_rank
    return nil if player_ranks.nil?
    @season_rank ||= player_ranks.find { |r| r['rank_type'] == ['S'] }['rank_value'].first.to_i
  end

  def original_rank
    return nil if player_ranks.nil?
    @original_rank ||= player_ranks.find { |r| r['rank_type'] == ['OR'] }['rank_value'].first.to_i
  end
end
