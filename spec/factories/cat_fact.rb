# frozen_string_literal: true

FactoryBot.define do
    factory :cat_fact do
      description { "random fact #{rand(1000000000)}" }
    end
  end
  