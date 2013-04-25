class TextToSpeechController < ApplicationController
  def index
    @languages = Language.all
    @languages.sort! { |a, b| a.name.downcase <=> b.name.downcase }
  end
end
