Rails.application.routes.draw do
  resources :users
  resources :devices
  resources :sales
  resources :job_requests
  resources :solutions
  resources :connexion
  resources :admins

  get '/job_requests/jobs_solve'

root 'connexion#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
