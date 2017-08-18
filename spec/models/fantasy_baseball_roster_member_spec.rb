require 'rails_helper'

RSpec.describe FantasyBaseballRosterMember, type: :model do
  let(:roster_member) { described_class.new(args) }
  let(:first_name) { 'Jonathan' }
  let(:external_id) { '8609' }
  let(:eligible_positions) { 'C,1B,Util,NA' }

  let(:args) do
    {
      'first_name' => first_name,
      'external_id' => external_id,
      'eligible_positions' => eligible_positions,
      'invalid' => junk
    }
  end

  describe '.initialize' do
    it 'returns valid attributes' do
      expect(roster_member.first_name).to eq first_name
      expect(roster_member.external_id).to eq external_id
      expect(roster_member.eligible_positions).to eq eligible_positions
    end
  end
end
