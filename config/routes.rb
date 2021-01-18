Rails.application.routes.draw do
  get 'onliner_mood/index'
  devise_for :admin

  namespace :admin do
    root to: 'load#index'
    get 'load/index'
    post 'load/onliner'
    post 'load/rabotaby'
  end
end
