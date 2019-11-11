Rails.application.routes.draw do
  resources :extensions do
    resources :updates
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
