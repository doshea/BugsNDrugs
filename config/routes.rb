BugsNDrugs::Application.routes.draw do
  root to: 'pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get '/live_search' => 'pages#live_search'

  resources :users, only: [:new, :create]
  resources :bugs, only: [:index, :show] do
    member do
      get :show_preview
      get :refresh_preview
    end
  end
  resources :bug_classes, only: [:show]
  resources :drugs, only: [:index, :show] do
    member do
      get :show_preview
    end
  end
  resources :drug_classes, only: [:show]
  resources :symptoms, only: [:index, :show]
  
  namespace :account do
    get '/', action: :show
    patch :update
    patch :change_password
    get :forgot
    get :forgot_username
    get :forgot_password
    patch :reset_password
  end

  namespace :admin do
    get '/', action: :index
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :bugs, except: :show do
      member do
        patch :update_array
      end
    end
    resources :drugs, except: :show
    resources :drug_classes, except: :show
    resources :bug_classes, except: :show do
      member do
        post :add_bug_class
      end
      collection do
        get :refresh
      end
    end
  end
end