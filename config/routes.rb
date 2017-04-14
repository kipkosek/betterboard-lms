Rails.application.routes.draw do

  # get 'sources/index'
  #
  # get 'sources/show'
  #
  # get 'sources/new'
  #
  # get 'sources/edit'

  resources :sources

  resources :dashboard, only: [:index]

  devise_for :instructors
  devise_for :students

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
