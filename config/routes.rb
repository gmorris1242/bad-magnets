Rails.application.routes.draw do
  root 'pages#home'

  get 'news', to: "pages#news",
              as: 'news'

  get 'music', to: "pages#music",
               as: 'music'

end
