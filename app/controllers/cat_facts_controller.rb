class CatFactsController < ApplicationController
  include HTTParty

  def cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    fact = CatFact.find_or_create_by(description: response['fact'])
    response['fact_id'] = fact.id
    response['liked_fact'] = User.find(id: params[:user_id]).cat_facts.where(id: fact.id).present? if params[:user_id]
    render json: { body: response }, status: 200
  end

  def liked_cat_facts
    user = User.find(params[:id])
    liked_facts = user.cat_facts.select('id', 'description')
    render json: { body: liked_facts }, status: 200
  end

  def popular_cat_facts
    most_liked = CatFact.left_joins(:likes).select('id', 'description').group(:id).order('COUNT(likes.id) DESC').limit(10)
    render json: { body: most_liked }, status: 200
  end

  def like_cat_fact
    user = User.find(params[:user_id])
    cat_fact = CatFact.find(params[:fact_id])
    new_like = Like.new(user_id: user.id, cat_fact_id: cat_fact.id)
    if new_like.save
      render json: { body: new_like }, status: 201
    else
      render json: { body: { errors: new_like.errors.full_messages } }, status: 400
    end
  end
end
