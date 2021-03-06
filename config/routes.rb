Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#index"

  get "/about", to: "pages#about"

  resources :favorites, only: [:index]

  resources :boards do
    member do
      post :favorite
    end

    resources :posts, shallow: true do
      resources :comments, shallow: true, only: [:create]
    end
  end

  resources :users , only: [:create] do
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end
  #可自行控制頁面
end



