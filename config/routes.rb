Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'
  # get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end

  delete "bookmarks/:id", to: "bookmarks#destroy", as: :bookmark
end
