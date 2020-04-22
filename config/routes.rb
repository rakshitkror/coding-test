Rails.application.routes.draw do
  get 'welcome/index'
  post 'welcome/createmovie'
  get 'welcome/get_seats'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
