Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists, :events, :genres, :users

    end
  end
end
