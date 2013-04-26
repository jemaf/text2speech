Text2speech::Application.routes.draw do
  get "/", :to => "text_to_speech#index", :as => :root
  post "/", :to => "text_to_speech#create", :as => false

  get "languages/", :to => "languages#index", :as => :languages

  get "languages/new", :to => "languages#new", :as => :new_language
  post "languages/new", :to => "languages#create", :as => false

  get "languages/delete/:id", :to => "languages#delete", :as => :delete_language 
end
