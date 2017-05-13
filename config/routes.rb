Rails.application.routes.draw do

  # get 'students/index'

  resources :assignments do
    resources :submissions, except: [:index]
  end

  resources :sources

  resources :dashboard, only: [:index]

  devise_for :instructors
  devise_for :students

  resources :students, only: [:index, :show]

  namespace :instructor do
    resources :assignments do
      resources :submissions, only: [:index, :show, :update, :destroy]
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
