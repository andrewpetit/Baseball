# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::YahooBase, type: :class do
  include_context 'yahoo_base_response_stubs'
  let(:yahoo_access_token) { instance_double('YahooAccessToken') }
  let(:yahoo_base) { described_class.new(yahoo_access_token) }

  describe '#current_mlb_id' do
    context 'with valid response' do
      before do
        allow(yahoo_base).to receive(:raw_response).and_return(valid_mlb_id_response)
      end

      it 'gives mlb id' do
        expect(yahoo_base.current_mlb_id).to eq current_mlb_id
      end

      it 'calls parse response' do
        yahoo_base.current_mlb_id
        expect(yahoo_base).to have_received(:raw_response).with(described_class::MLB_ID_URL)
      end
    end
  end

  describe '#current_nfl_pickem_id' do
    context 'with valid response' do
      before do
        allow(yahoo_base).to receive(:raw_response).and_return(valid_nfl_pickem_id_response)
      end

      it 'gives nfl pickem id' do
        expect(yahoo_base.current_nfl_pickem_id).to eq current_nfl_pickem_id
      end

      it 'calls parse response' do
        yahoo_base.current_nfl_pickem_id
        expect(yahoo_base).to have_received(:raw_response).with(described_class::NFL_PICKEM_ID_URL)
      end
    end
  end

  describe '#available_teams' do
    context 'with valid response' do
      before do
        allow(yahoo_base).to receive(:current_mlb_id).and_return(current_mlb_id)
        allow(yahoo_base).to receive(:current_nfl_pickem_id).and_return(current_nfl_pickem_id)
        allow(yahoo_base).to receive(:raw_response).and_return(valid_teams_response)
      end

      it 'gives mlb team' do
        expect(yahoo_base.available_mlb_teams).to eq mlb_team
        expect(yahoo_base.available_mlb_teams.count).to eq 2
      end

      it 'gives nfl pickem team' do
        expect(yahoo_base.available_nfl_pickem_teams).to eq pickem_team
      end
    end
  end

  describe 'invalid response' do
    before do
      allow(yahoo_access_token).to receive(:get).and_return({})
    end

    it 'catches mlb error' do
      expect { yahoo_base.current_mlb_id }.to raise_error(StandardError)
    end

    it 'catches nfl error' do
      expect { yahoo_base.current_nfl_pickem_id }.to raise_error(StandardError)
    end
  end
end
