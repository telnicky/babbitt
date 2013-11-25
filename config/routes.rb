Babbitt::Application.routes.draw do

  root :to => "home#index"
  get 'logs', :to => "home#logs"
  get 'documents', :to => "home#documents"
  get 'slides', :to => "home#slides"
  get 'references', :to => "home#references"

  resources :steps, :only => [ :create, :new, :show, :index ]
  resources :hearts, :only => [ :create, :new, :show, :index ]
end
