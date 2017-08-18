RSpec.shared_context 'yahoo_base_response_stubs' do
  let(:current_mlb_id) { '370' }
  let(:league_ids) { ['370.l.85254', '370.l.85255'] }

  let(:valid_mlb_id_response) do
    { 'xml:lang' => 'en-US',
      'yahoo:uri' => 'http://fantasysports.yahooapis.com/fantasy/v2/game/mlb',
      'time' => '27.910947799683ms',
      'copyright' => 'Data provided by Yahoo! and STATS, LLC',
      'refresh_rate' => '60',
      'xmlns:yahoo' => 'http://www.yahooapis.com/v1/base.rng',
      'xmlns' => 'http://fantasysports.yahooapis.com/fantasy/v2/base.rng',
      'game' =>
    [{ 'game_key' => [current_mlb_id.to_s],
       'game_id' => [current_mlb_id.to_s],
       'name' => ['Baseball'],
       'code' => ['mlb'],
       'type' => ['full'],
       'url' => ['https://baseball.fantasysports.yahoo.com/b1'],
       'season' => ['2017'],
       'is_registration_over' => ['1'],
       'is_game_over' => ['1'],
       'is_offseason' => ['0'] }] }
  end
end
