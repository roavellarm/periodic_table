Rails.application.routes.draw do
  root to: "welcome#index"
  resources :table, only: %i[index show]

  resources :elements do
    resources :annotations, only: [:new, :create, :edit, :update, :destroy, :show]
  end
end
