Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true), defaults: { format: :json }  do
    resources :posts
  end

  scope module: :v2, constraints: ApiConstraints.new(version: 2), defaults: { format: :json }  do
    resources :posts
  end

end
