Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :recipes do
      collection do
        get 'import'
      end
    end
    resources :menu, only: [:show, :index] do
      get 'shopping_list', on: :member
      get 'generate', on: :collection
    end
  end
end
