Rails.application.routes.draw do
  get 'searches/index'
  post 'searches/save_query', to: 'searches#save_query'
  get 'home/welcome'
  root to: "home#welcome"
  get 'analyses', to: 'analyses#index'
  # Koristite delete umesto get za odjavljivanje i dodajte devise_scope blok
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy', as: :custom_destroy_user_session
  end

  devise_for :users, controllers: {
    sessions: 'devise/sessions'
  }
end
