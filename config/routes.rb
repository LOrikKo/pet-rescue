Rails.application.routes.draw do
  root 'static_pages#home'
  get '/account_select', to: 'static_pages#account_select'
  get '/profile_review/:id', to: 'profile_reviews#show', as: 'profile_review'

  get '/adoptable_dogs', to: 'adoptable_dogs#index'
  get '/adoptable_dogs/:id', to: 'adoptable_dogs#show', as: 'adoptable_dog'

  post 'create_adopter_application', to: 'adopter_applications#create'
  patch 'update_adopter_application', to: 'adopter_applications#update'

  post 'create_adoption', to: 'adoptions#create'

  delete 'attachments/:id/purge', to: 'attachments#purge', as: 'purge_attachment'

  resources :dogs, controller: 'organization_dogs'
  resources :adopter_applications, controller: 'adoption_application_reviews'

  devise_for :users, controllers: { registrations: 'registrations' }

  resource :adopter_profile, only: [:new, :create, :show, :edit, :update ], as: 'profile'
  resolve('adopter_profile') { [:adopter_profile] }

end
