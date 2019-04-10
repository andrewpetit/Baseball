# frozen_string_literal: true

shared_context 'devise_testing_setup' do
  # render_views

  let(:user) { create :user }

  # rubocop:disable RSpec/InstanceVariable
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
  # rubocop:enable RSpec/InstanceVariable
end
