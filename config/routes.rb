Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calculate#index'
  get '/', to: "calculate#index"
  post '/', to: "calculate#index"
  end
