Rails.application.routes.draw do
 mount_devise_token_auth_for 'User', at: 'auth'
  defaults format: :json do 
    resources :evaluations, only: [:index, :create, :show] do
      member do
       post :answers
      end
    end
    
    resources :law_areas do
      member do
        get :questions
      end
    end

    resources :questions
    resources :users
    resources :user_profiles
    resources :evaluation_questions
    resources :evaluation_law_areas
  end
end