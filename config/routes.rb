Text2speech::Application.routes.draw do
  get "languages/index", :to => "languages#index", :as => :languages

  get "languages/new", :to => "languages#new", :as => :new_language
  post "languages/new", :to => "languages#create", :as => false

  get "/", :to => "TextToSpeech#index"
end
