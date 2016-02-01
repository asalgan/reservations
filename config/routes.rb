Rails.application.routes.draw do
  root to: 'reservations#index'

  get 'reservations/check_availability' => 'reservations#check_availability'
  resources :reservations

end
