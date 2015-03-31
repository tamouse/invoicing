require 'sinatra'
Rails.application.routes.draw do
  root 'invoices#index'
  resources :invoices do
    resources :invoice_items
    get 'submit', on: :member
  end
  get 'static_pages/index'

  mount Sidekiq::Web => '/sidekiq'
end
