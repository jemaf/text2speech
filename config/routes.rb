Text2speech::Application.routes.draw do
  get "languages/", :to => "languages#index", :as => :languages

  get "languages/new", :to => "languages#new", :as => :new_language
  post "languages/new", :to => "languages#create", :as => false

  get "languages/delete/:id", :to => "languages#delete", :as => :delete_language 

  get "/", :to => "TextToSpeech#index"
end
