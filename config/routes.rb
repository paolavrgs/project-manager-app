Rails.application.routes.draw do
  resources :tasks
  resources :projects
  get '/', to: 'application#index', as: :root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
