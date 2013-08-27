Babbitt::Application.routes.draw do
  root :to => "home#index"
  resources :steps, :only => [ :create, :new, :show, :index ]
end
