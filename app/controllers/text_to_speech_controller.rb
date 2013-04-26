class TextToSpeechController < ApplicationController
  def index
    @languages = Language.all
    @languages.sort! { |a, b| a.name.downcase <=> b.name.downcase }
  end

  def create

    text = params[:translation_text]
    lang = params[:languages]

    if text.present?
      file_name = "audio/" + Time.now.to_i.to_s + ".mp3"
      text.to_file lang, file_name
      send_file file_name
    else
      flash[:error] = t("flash.tts.no_message")
      redirect_to root_path
    end
  end
end
