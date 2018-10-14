Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  devise_for :accounts

  resources :document_templates do
    scope module: :document_templates do
      resources :linked_elements, only: [:new, :destroy]
      resources :html_elements, only: [:new, :create]
      resources :input_elements, only: [:new, :create]
    end
  end

  resources :completed_documents, only: [:create, :show, :edit, :update]
end
