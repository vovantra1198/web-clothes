Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations",
    sessions: "users/sessions",
    confirmations: "users/confirmations",
    passwords: "users/passwords" }
  root "static_pages#home"

  resources :users, only: :show do
    patch "update_image", on: :member
  end

  resources :products, only: [:index, :show]

  namespace :admin do
    resources :products do
      patch "update_image", on: :member
      get "edit_image", on: :member
    end
  end



end
