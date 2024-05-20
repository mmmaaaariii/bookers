Rails.application.routes.draw do
  resources :users
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'homes#top'
  get 'books' => 'books#index', as: 'index'
  post 'books' => 'books#create' 
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
　patch 'books/:id' => 'books#update', as: 'update_book'
end
