Rails.application.routes.draw do
  resources :venues
  resources :movies do
  	resources :seats 
  end
  get 'welcome/index'
  post 'welcome/createmovie'
  post 'welcome/book_seats'
  get 'welcome/get_seats'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
