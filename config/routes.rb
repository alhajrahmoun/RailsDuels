# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'user_levels/edit', as: 'edit_user_level'
  patch 'user_levels/update', as: 'update_user_level'

  post 'matchmaking', to: 'matchmaking#create', as: 'create_matchmaking'
  delete 'matchmaking', to: 'matchmaking#destroy', as: 'destroy_matchmaking'

  resources :duel_problems, only: [:index]

  resources :duels do
    resources :submissions, only: %i[new create]
    get 'summary', on: :member, to: 'summaries#show'
  end

  resources :problem_sets do
    resources :problems, except: %i[index show]
  end

  get 'profile', to: 'profiles#show', as: 'profile'
  get 'leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  get 'leaderboard/:level', to: 'leaderboard#show', as: 'level_leaderboard'
  get 'static_pages/index'

  root 'static_pages#index'
end
