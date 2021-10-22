Rails.application.routes.draw do
  root "home#index"
  get "/accounts/:id/flag", to: "accounts#flag", as: "accounts_flag"
  get "/accounts/:id/total", to: "accounts#total", as: "accounts_total"
  resources :banks
  resources :transactions
  resources :accounts do
    resources :transactions
  end
end
