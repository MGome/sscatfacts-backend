class CatFactsController < ApplicationController
  include HTTParty

  def cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    render json: response
  end

  def liked_cat_facts
    user = User.find(params[:id])
    liked_facts = user.cat_facts.select('id', 'description')
    render json: { likes: liked_facts }
  end

  def popular_cat_facts
    most_liked = CatFact.left_joins(:likes).select('id', 'description').group(:id).order('COUNT(likes.id) DESC').limit(10)
    render json: most_liked
  end
end
