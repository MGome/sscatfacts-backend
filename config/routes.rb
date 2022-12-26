Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cat_fact', to: 'cat_facts#cat_fact'
  get '/liked_cat_facts/:id', to: 'cat_facts#liked_cat_facts'
  get '/popular_cat_facts', to: 'cat_facts#popular_cat_facts'
  post '/like_cat_fact', to: 'cat_facts#like_cat_fact'
end
