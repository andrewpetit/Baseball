# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email        { "bob_#{SecureRandom.hex(6)}@test.com" }
    password     { 'password' }
    yahoo_access_token { nil }
  end
end
