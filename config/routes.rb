Babbitt::Application.routes.draw do
  resources :steps, :only => [ :create, :new, :show, :index ]
end
