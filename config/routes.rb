# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, path: 'a', controllers: { sessions: 'sessions' }

  devise_scope :admin do
    namespace :admin, path: 'a' do
      authenticated :admin do
        root 'dashboard#index'
        get '/dashboard', to: 'dashboard#index', as: 'dashboard'
        get '/a/sign_out', to: 'devise/sessions#destroy', as: :delete
        resources :students
        resources :klasses do
          resources :attendances, controller: '/admin/attendances'
          get 'disable_student', to: 'klasses#disable_student'
        end
        # resources :situations
        resources :teachers
        resources :justifications, only: %i[index show edit update]
      end
    end

    root 'devise/sessions#new', as: :unauthenticated_root
    resources :justifications, path: 'justificativa', path_names: { new: 'novo' }, only: %i[new create]
  end
end
