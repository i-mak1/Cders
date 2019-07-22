Rails.application.routes.draw do

      get 'shippings/new'
      get 'admin_labels/new'
      get 'admin_artists/new'
      devise_for :admins, path: 'admins', controllers: {
      	sessions: 'admins/sessions',
      	passwords: 'admins/passwords'
      }

      devise_for :endusers, path: 'endusers', controllers: {
      	sessions: 'endusers/sessions',
      	passwords: 'endusers/passwords',
      	registrations: 'endusers/registrations'
      }

      get 'endusers/:id/unsubscribe' => 'endusers#unsubscribe'
      get 'endusers/complete' => 'endusers#complete'
      resources :endusers, only: [:show, :edit, :update]
    # itemsコントローラー
    resources :items, only: [:index, :show, :create]

    # cartsコントローラー
    resources :carts, only: [:show, :update, :destroy]
    post 'carts/:id/create' => 'carts#create', as: 'create_cart'

    #ordersコントローラー
    resources :orders, only: [:new, :create]
    get 'orders/payment' => 'orders#payment'
    get 'orders/:id/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/complete' => 'orders#complete'

    #contactsコントローラー
    resources :contacts, only: [:new, :create]

    #admin_endusersコントローラー
    resources :admin_endusers, only: [:index, :show, :edit, :update, :destroy]

    #admin_itemsコントローラー
    resources :admin_items, only: [:index, :show, :new, :edit, :update, :destroy, :create]

    #admin_ordersコントローラー
    resources :admin_orders, only: [:index, :show, :update]

    #admin_contactsコントローラー
    resources :admin_contacts, only: [:index, :show, :update]
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    #admin_artistsコントローラー
    resources :admin_artists, only: [:new, :create]

    #admin_labelsコントローラー
    resources :admin_labels, only: [:new, :create]

    #shippingsコントローラー
    resources :shippings, only: [:new, :create]

    root 'items#index'
end
