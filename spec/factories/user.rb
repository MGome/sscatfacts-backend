# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "sample-user #{rand(1000000000)}" }
  end
end
