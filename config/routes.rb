Rails.application.routes.draw do

  devise_for :admins, path: 'admins', controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords'
  }
  devise_for :endusers, path: 'endusers', controllers: {
  	sessions: 'endusers/sessions',
  	passwords: 'endusers/passwords',
  	registrations: 'endusers/registrations'
  }
  resources :endusers, only: [:show, :edit, :update]
  get 'endusers/:id/unsubscribe' => 'endusers#unsubscribe'
  get 'endusers/complete' => 'endusers#complete'

# itemsコントローラー
resources :items, only: [:index, :show]

# cartsコントローラー
resources :carts, only: [:show, :update, :destroy]

#ordersコントローラー
resources :orders, only: [:new, :create]
get 'orders/payment' => 'orders#payment'
get 'orders/confirm' => 'orders#confirm'
get 'orders/complete' => 'orders#complete'

#contactsコントローラー
resources :contacts, only: [:new, :create]

#admin_usersコントローラー
resources :admin_endusers, only: [:index, :show, :edit, :update, :destroy]

#admin_itemsコントローラー
resources :admin_items, only: [:index, :show, :new, :edit, :update, :destroy]

#admin_ordersコントローラー
resources :admin_orders, only: [:index, :show, :update]

#admin_contactsコントローラー
resources :admin_contacts, only: [:index, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'items#index'
end
