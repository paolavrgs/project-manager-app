Rails.application.routes.draw do
  resources :developers
  resources :requirements
  resources :tasks
  resources :projects do
    patch '/:id/update_state', action: :update_state, on: :collection
  end
  get '/', to: 'application#index', as: :root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
