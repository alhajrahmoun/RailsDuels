# frozen_string_literal: true

Rails.application.routes.draw do
  mount AhoyCaptain::Engine => '/control'
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

  resources :custom_duels, only: %i[index new create show] do
    resources :participants, only: %i[create destroy], controller: 'custom_duel_participants'
  end

  get 'history', to: 'user_duels#index', as: 'history'
  get 'join/:id', to: 'custom_duel_join#show', as: 'join_custom_duel'
  patch 'start/:id', to: 'custom_duel_start#update', as: 'start_custom_duel'

  get 'settings', to: 'settings#show', as: 'settings'
  get 'leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  get 'leaderboard/:level', to: 'leaderboard#show', as: 'level_leaderboard'
  get 'static_pages/index'

  root 'static_pages#index'
end
