class CatFactsController < ApplicationController
  include HTTParty

  def cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    render json: response
  end
end
