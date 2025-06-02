Rails.application.routes.draw do

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'registrations'
      }

      defaults format: :json do
        resources :users, only: [:index, :show, :update, :destroy] do
          member do
            get :performance        # GET /users/:id/performance
          end
        end

        resources :questions, only: [:index, :show, :create, :update, :destroy] do
          collection do
            get :random             
          end
        end

        resources :law_areas, only: [:index, :show, :create, :destroy, :update] do
          member do
            get :questions          # GET /law_areas/:id/questions (questões por área)
            get :performance        # GET /law_areas/:id/performance (desempenho por área)
          end
        end

        resources :evaluations, only: [:index, :show, :create] do
          member do
            post :submit_answers     # POST /evaluations/:id/submit_answers
            get  :results            # GET  /evaluations/:id/results
          end

          collection do
            post :start_objective    # POST /evaluations/start_objective
            post :start_written      # POST /evaluations/start_written
            get  :my                 # GET  /evaluations/my
          end
        end

        resources :user_answers, only: [:create, :update]

        # Desempenho do Usuário (geral)
        resources :user_performances, only: [:index, :show]

      end

end

