# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do # rubocop:disable Metrics/BlockLength
  context 'when request is POST users#create with correct params' do
    it 'should increment users by one and respond created status code' do
      expect { post create_user_path, params: { username: "sample-name" } }.to change(User, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  context 'when request is POST users#create with incorrect params' do
    it 'should not increment users count and respond bad request status code' do
      expect { post create_user_path }.to change(User, :count).by(0)
      expect(response).to have_http_status(:bad_request)
    end
  end
end