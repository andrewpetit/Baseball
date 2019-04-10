# frozen_string_literal: true

FactoryBot.define do
  factory :roster_sort do
    sort_type { 'test sort' }
    description { 'test sort desc' }
  end
end
