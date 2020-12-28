Rails.application.routes.draw do
  
  devise_for :admin  

  namespace :admin do
    root to: 'load#index'
    get 'load/index'
    post 'load/onliner'
    post 'load/rabotaby'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'start', to: 'start#index'
end
