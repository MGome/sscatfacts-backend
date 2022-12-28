# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CatFacts', type: :request do # rubocop:disable Metrics/BlockLength
  context 'when request is GET cat_facts#cat_fact with user_id' do
    let!(:new_user) { create(:user) }

    it 'should find a cat fact and respond ok status code' do
      get cat_fact_path, params: { user_id: new_user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when request is GET cat_facts#cat_fact without user_id' do
    it 'should not find a cat fact and respond bad request status code' do
      get cat_fact_path
      expect(response).to have_http_status(:bad_request)
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

  context 'when request is POST cat_facts#like_cat_fact without user_id' do
    let!(:new_cat_fact) { create(:cat_fact) }

    it 'should respond bad request status code' do
      post like_cat_fact_path, params: { fact_id: new_cat_fact.id }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'when request is POST cat_facts#like_cat_fact without fact_id' do
    let!(:new_user) { create(:user) }

    it 'should respond bad request status code' do
      post like_cat_fact_path, params: { user_id: new_user.id }
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'when request is GET cat_facts#liked_cat_facts' do
    let!(:new_user) { create(:user) }
    let!(:new_cat_fact) { create(:cat_fact) }

    before do
      post like_cat_fact_path, params: { user_id: new_user.id, fact_id: new_cat_fact.id }
    end

    it 'should find one liked cat fact and respond ok status code' do
      get liked_cat_facts_path(id: new_user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when request is GET cat_facts#popular_cat_facts' do
    it 'should respond ok status code' do
      get popular_cat_facts_path
      expect(response).to have_http_status(:ok)
    end
  end
end
