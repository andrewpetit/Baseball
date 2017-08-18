# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

RosterSort.find_or_create_by(sort_type: RosterSort::SEASON_RANK, description: 'Season Ranks')
RosterSort.find_or_create_by(sort_type: RosterSort::SEASON_STAT_RANK, description: 'Season Stats')
RosterSort.find_or_create_by(sort_type: RosterSort::ORIGINAL_RANK, description: 'Orginal Ranks')

UpdateType.find_or_create_by(update_type: UpdateType::MANUAL)
UpdateType.find_or_create_by(update_type: UpdateType::AUTO)

