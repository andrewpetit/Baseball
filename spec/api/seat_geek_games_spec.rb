# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SeatGeekGames, type: :class do
  include_context 'seat_geek_response_stubs'
  let(:seat_geek) { described_class.new }

  let(:start_date) { Time.now }
  let(:end_date) { (Time.now + (60 * 60 * 24)) }

  describe '#todays_games' do
    before do
      allow(Time).to receive(:now).and_return(start_date)
      allow(seat_geek).to receive(:get_games).and_return(nil)
      seat_geek.todays_games
    end

    it 'uses todays date' do
      expect(seat_geek).to have_received(:get_games).with(start_date, end_date)
    end
  end

  describe '#get_games' do
    let(:url) { seat_geek.send(:url, start_date, end_date) }
    let(:status) { 200 }

    before do
      stub_request(:get, url)
        .to_return(status: status, body: body, headers: {})
    end

    context 'with good response' do
      it 'parses the games' do
        expect(seat_geek.get_games(start_date, end_date)).to eq parsed_response
      end
    end

    context 'with bad response' do
      let(:status) { 500 }

      it 'returns empty array' do
        expect(seat_geek.get_games(start_date, end_date)).to eq []
      end
    end
  end
end
