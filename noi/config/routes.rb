Rails.application.routes.draw do
  get 'messages/incoming'
  get 'home/about_us'
  resources :friendships

  resources :messages do
    collection do
      get :sent
      get :received
     end

    member do
      post 'mark_as_read'
    end
  end


  resources :sessions, only: [:new, :create]

  delete 'logout' => 'sessions#destroy'
  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
