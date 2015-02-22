Rails.application.routes.draw do
  root 'invoices#index'
  resources :invoices

  get 'static_pages/index'
end
