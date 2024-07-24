Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"

  scope :api do
    scope :v1 do
      post "authorize", to: "authentication#guest_authorize"

      scope :products do
        get "available", to: "product#available"
        post "intro_gpt/:id", to: "product#intro_gpt"
        post "/", to: "product#create"
        get "/:id", to: "product#show"
        put "/:id", to: "product#update"
      end
    end
  end
end
