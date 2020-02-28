Rails.application.routes.draw do
  root 'pages#home'

  get 'news', to: "pages#news",
              as: 'news'

  get 'music', to: "pages#music",
               as: 'music'

  get 'contact', to: "pages#contact",
                 as: 'contact'

 get 'live', to: "pages#live",
                as: 'live'

  resources :email_list, only: :create
  resources :contact, only: :create
end
