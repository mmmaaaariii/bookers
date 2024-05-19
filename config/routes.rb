Rails.application.routes.draw do
  resources :users
  get '/', to: 'homes#top'
  get 'books' => 'books#index'
  post 'books' => 'books#create' 
  get 'books/:id' => 'books#show'
  get 'books/:id/edit' => 'books#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
