Rails.application.routes.draw do

  devise_for :accounts

  resources :locations, only: [:show]
  resources :locations, path: "/admin/locations"
  get "locations/:id/pikeup", to: "locations#pikeup", as: "pikeup"

  resources :dragons

  root to: "public#home"
end
