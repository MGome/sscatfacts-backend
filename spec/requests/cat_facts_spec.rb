# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CatFacts', type: :request do # rubocop:disable Metrics/BlockLength
  context 'when request is GET cat_facts#cat_fact' do
    it 'should find a cat fact and respond ok status code' do
      get cat_fact_path
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when request is POST cat_facts#like_cat_fact with correct params' do
    let!(:new_user) { create(:user) }
    let!(:new_cat_fact) { create(:cat_fact) }

    it 'should increment likes by one and respond created status code' do
      expect { post like_cat_fact_path, params: { user_id: new_user.id, fact_id: new_cat_fact.id } }.to change(Like, :count).by(+1)
      expect(response).to have_http_status(:created)
    end
  end

  # context 'when request is GET cat_facts#liked_cat_facts' do
  #   let!(:new_user) { create(:user) }

  #   it 'should not increment users count and respond bad request status code' do
  #     expect { post create_user_path }.to change(User, :count).by(0)
  #     expect(response).to have_http_status(:bad_request)
  #   end
  # end

  # context 'when request is GET users#find_user with correct params' do
  #   let!(:new_user) { create(:user) }

  #   it 'should find the user and respond ok status code' do
  #     get find_user_path, params: { username: new_user.username }
  #     expect(response).to have_http_status(:ok)
  #   end
  # end

  # context 'when request is GET users#find_user with incorrect params' do
  #   it 'should not find the user and respond not found status code' do
  #     get find_user_path
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end
end