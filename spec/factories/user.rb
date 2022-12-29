# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "sample-user #{rand(1_000_000_000)}" }
  end
end
