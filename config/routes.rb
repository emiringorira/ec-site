Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :publics, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  root 'public/homes#top'

  scope module: :public do
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy,:create]
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :end_users, only: [:show, :edit, :update]
  get 'end_users' => 'end_users#unsubscribe'
  patch 'end_users' => 'end_users#withdraw'
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :create, :index, :show]
  post 'orders' => 'orders#confirm'
  get 'orders' => 'orders#complete'
  get 'top' => 'homes/#top'
  get 'about' => 'homes/#about'
  end
  namespace :admin do
  resources :end_users, only:[:index, :show, :edit, :update]
  resources :genres, only:[:index, :create, :edit, :update]
  resources :items, only:[:index, :new, :create, :show, :edit, :update]
  resources :order_details, only:[:update]
  resources :orders, only:[:index, :show, :update]
  get 'top' => 'homes/#top'
  end
end
