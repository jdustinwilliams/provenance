Rails.application.routes.draw do
  resources :provenance_records do
    get :confirm_destroy
  end
  get 'clear_settings', to: 'provenance_records#clear_settings', via: [:destroy], as: :clear_settings
end
