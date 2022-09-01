Rails.application.routes.draw do
  namespace :admin do 
    
    get 'dashboard/main'
    get 'dashboard/user'
    get 'dashboard/blog'
  
  end



  get 'about', to: "pages#about"
  
# to keyword is used to route to a specific path and as is used as alias name for the prefix in rails route output and the prefix can be used into other pages for clean code
  get 'contact', to: "pages#contact", as: "contact/mine"
  
  resources :mines

# except keyword will route the other pages except the page that had been provided as a array to it
  resources :posts, except: [:show] 


# *missing is used to route to a specific missing index page so that the missing pages can be redirected

  get 'posts/*missing', to: 'posts#missing'

  root to: 'pages#home'
  
end
