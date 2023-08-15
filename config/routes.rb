Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }

  root to: redirect('/login'), constraints: ->(request) { !request.env['warden'].user }

  authenticated :user do
    resources :users, only: :index

    resources :groups, only: [:index, :new, :create, :show, :destroy, :update] do
      resources :movements, only: [:index, :new, :create, :destroy, :update]
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
