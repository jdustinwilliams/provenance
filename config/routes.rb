Rails.application.routes.draw do
  resources :provenance_records do
    get :confirm_destroy
  end
end
