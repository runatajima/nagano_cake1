Rails.application.routes.draw do

root "public/homes#top"
  scope modele: 'customers' do
    #root 'items#top'
    resources :items, only: [:show, :index]
    get 'about' => 'items#about'
   end

namespace :public do
   patch '/members/withdrawal' => 'members#destroy'
   get '/members/withdrawal' => 'members#withdrawal'
   patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
   get 'show' => 'customers#show'
   get 'customers/edit' => 'customers#edit'
   patch 'update' => 'customers#update'
   get 'edit' => 'customers#edit'
   get 'orders/new' => 'orders#about', as: 'orders_about'
   get 'orders/complete' => 'orders#complete'
   get '/homes/about' => 'homes#about'
   resources :orders, only: [:create, :new, :index, :show]
   resources :items, only: [:show, :index]
   resources :cart_items, only: [:index, :create, :update, :destroy]
   delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
   resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end


namespace :admin do
   root :to => 'homes#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show,  :new, :create, :edit, :update, :index]
   resources :orders, only: [:index, :show, :update]
   resources :orders_details, only: [:update]
  end


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [ :registrations,:passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
