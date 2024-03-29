Rails.application.routes.draw do
devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"

get 'home/about' => 'homes#about', as: 'about'

resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]

  resources :book_comments, only: [:create, :destroy]

end

resources :users, only: [:create, :show, :edit, :index, :update]
end
