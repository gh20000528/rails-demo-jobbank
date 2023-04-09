Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" , to: "pages#home",as:'root'


  resource :sessions, only: [:create, :destroy]

  resource :users ,except: %i[new destroy] do
    get "sign_up" , action: "new"
    get "sign_in"
  end
  resources :resumes

  resources :resumes do
    resources :comments, shallow: true, only: %i[create edit update destroy]
  end



  #簡寫 root "pages#home"
  get "/about" , to:"pages#about" ,as:'about'
  get "/contact", to:"pages#contact",as:'contact'
  
resources :res_name
end
