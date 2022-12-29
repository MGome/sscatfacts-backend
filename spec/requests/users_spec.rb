# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'when request is POST users#create with correct params' do
    it 'should increment users by one and respond created status code' do
      expect { post create_user_path, params: { username: 'sample-name' } }.to change(User, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  context 'when request is POST users#create with incorrect params' do
    it 'should not increment users count and respond bad request status code' do
      expect { post create_user_path }.to change(User, :count).by(0)
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'when request is GET users#find_user with correct params' do
    let!(:new_user) { create(:user) }

    it 'should find the user and respond ok status code' do
      get find_user_path, params: { username: new_user.username }
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when request is GET users#find_user with incorrect params' do
    it 'should not find the user and respond not found status code' do
      get find_user_path
      expect(response).to have_http_status(:not_found)
    end
  end
end
