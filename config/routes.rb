Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  resources :fantasy_baseball_teams do
    resources :fantasy_baseball_rosters, only: [:index]
  end
  put 'fantasy_baseball_teams/:id/update_roster(.:format)', :to => 'fantasy_baseball_teams#update_roster', :as => :fantasy_baseball_teams_update_roster
  namespace :add do
    resources :fantasy_baseball_teams, only: [:index]
    get 'fantasy_baseball_teams/auth_account'
    get 'fantasy_baseball_teams/set_access_token'
  end

  devise_for :users
end
