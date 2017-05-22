Rails.application.routes.draw do
  # Define the path for menu is the home controller menu action
  get 'menu' => 'home#menu'
  get 'contact_us' => 'home#contact_us'
  root 'home#index'
end
