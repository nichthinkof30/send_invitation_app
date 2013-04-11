FunCoolVenture::Application.routes.draw do

  root to: "users#new"
  match 'homepage' => 'home#index', as: "homepage"  

  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"
  get "sign_up" => "users#new", as: "sign_up"
  post "send_invitation" => "invitations#send_invite", as: "send_invitation"
  post "check_invitation" => "invitations#check_invite", as: "check_invitation"
  
  resources :rewards
  resources :sessions
  resources :users, only: [:new, :create]

end
