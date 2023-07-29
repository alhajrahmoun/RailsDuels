Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'user_levels/edit', as: 'edit_user_level'
  patch 'user_levels/update', as: 'update_user_level'
  get 'queues/index', as: 'queues'

  get 'static_pages/index'

  root "static_pages#index"
end
