Rails.application.routes.draw do
  devise_for :users
  root "pages#splash"
  resources :extensions do
    resources :updates
  end
  get :alphabet, :action => :alphabet, :controller => :extensions
  get '/splash' => 'pages#splash'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
