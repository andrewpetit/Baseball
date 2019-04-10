# frozen_string_literal: true

class StatRanks
  STAT_SORT = { '7' => 'DESC',
                '8' => 'DESC',
                '12' => 'DESC',
                '13' => 'DESC',
                '16' => 'DESC',
                '21' => 'ASC',
                '3' => 'DESC',
                '4' => 'DESC',
                '50' => 'DESC',
                '28' => 'DESC',
                '32' => 'DESC',
                '42' => 'DESC',
                '26' => 'ASC',
                '27' => 'ASC',
                '83' => 'DESC',
                '84' => 'ASC' }.freeze

  def initialize roster_ranks
    @roster_ranks = roster_ranks
  end

  def rank_by_stats
    # add index of each ordered stat
    stat_ids.each do |stat_id|
      if STAT_SORT[stat_id] == 'ASC'
        @roster_ranks.sort_by { |p| p.player_stats[stat_id] }.each_with_index do |p, i|
          p.season_stat_rank += (i + 1)
        end
      elsif STAT_SORT[stat_id] == 'desc'
        @roster_ranks.sort_by { |p| p.player_stats[stat_id] }.reverse!.each_with_index do |p, i|
          p.season_stat_rank += (i + 1)
        end
      end
    end
    @roster_ranks
  end

  private

  def stat_ids
    @stat_ids ||= @roster_ranks.first.player_stats.keys
  end
end
