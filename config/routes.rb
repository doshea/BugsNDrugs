BugsNDrugs::Application.routes.draw do
  root to: 'pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :bugs, only: [:index, :show]
  resources :bug_classes, only: [:index, :show]
  
  namespace :account do
    get '/', to: :show
    patch :update
    patch :change_password
  end

  namespace :admin do
    get '/', to: :index
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :bugs, except: :show
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