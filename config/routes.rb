Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cat_fact', to: 'cat_facts#cat_fact'
end
