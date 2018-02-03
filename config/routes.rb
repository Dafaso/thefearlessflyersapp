Rails.application.routes.draw do

  get '/riders/new' => 'riders#new', as: :application
  post '/riders' => 'riders#create'


  get '/flyers' => 'flyers#index'

  get '/flyers/new' => 'flyers#new'

  get '/flyers/:id' => 'flyers#show', as: :rider

  get '/flyers/:id/edit' => 'flyers#edit', as: :edit_rider

  patch 'flyers/:id' => 'flyers#update'
  post '/flyers' => 'flyers#create'


  get '/sign_in' => 'sessions#new', as: :sign_in

  post '/sign_in' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  root 'static_pages#index'

  get 'static_pages/index'

  get 'static_pages/supporters'

  get 'static_pages/youth'

  get 'static_pages/board'

  get 'static_pages/staff'

  get 'static_pages/photos'

  get 'static_pages/about'

  get 'static_pages/apply'

  get 'static_pages/thanks/:rider' => 'static_pages#thanks', as: :thanks

  get '/waiver' => 'static_pages#waiver', as: :waiver

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
