Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
    namespace :v1 do
      resources :courses 
      resources :students
    end
  end

  resources :students
  resources :courses do
    get :qr_code_generator ,on: :member
    get :qr_code_download ,on: :member
  end



  root 'students#index'

  get '/search', to:  'students#index'
  #get '/qr_code_generator', to:  'courses#qr_code_generator'
  # => get '/qr_code_download', to:  'courses#qr_code_download'

end
