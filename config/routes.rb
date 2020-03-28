Rails.application.routes.draw do

  devise_for :accounts

  resources :locations, only: [:show]
  resources :locations, path: "/admin/locations"
  resources :dragons

  root to: "public#home"
end
