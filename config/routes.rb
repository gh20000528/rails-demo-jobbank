Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :resumes
  get "/" , to: "pages#home",as:'root'
  #簡寫 root "pages#home"
  get "/about" , to:"pages#about" ,as:'about'
  get "/contact", to:"pages#contact",as:'contact'
  get "/resumes" , to:"resumes#index"
  post "/resumes", to:'resumes#create'
  get "/resumes/new" , to:"resumes#new",as:'new_resumes'
end
