Rails.application.routes.draw do
  get '/', to: redirect('/addresses/new')

  root 'addresses#new'

  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
