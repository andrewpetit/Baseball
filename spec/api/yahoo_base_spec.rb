require 'rails_helper'
require 'xmlsimple'
RSpec.describe Api::YahooBase, type: :class do
  include_context 'yahoo_base_response_stubs'
  let(:yahoo_base) { described_class.new(junk) }

  describe '#current_mlb_id' do
    context 'with valid response' do
      before do
        allow(yahoo_base).to receive(:parse_yahoo_response).and_return(valid_mlb_id_response)
      end

      it 'gives mlb id' do
        expect(yahoo_base.current_mlb_id).to eq current_mlb_id
      end

      it 'calls parse response' do
        yahoo_base.current_mlb_id
        expect(yahoo_base).to have_received(:parse_yahoo_response)
      end
    end
  end
end
