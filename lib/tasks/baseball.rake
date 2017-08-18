namespace :baseball do
  desc 'Updates lineups for auto_update teams'

  task optimize_active_lineups: :environment do
    User.all.each(&:deactivate_leagues)

    auto = UpdateType.find_by(update_type: UpdateType::AUTO)
    FantasyBaseballTeam.optimizable_leagues.each do |team|
      team.update_roster auto
    end
  end
end
