class TextToSpeechController < ApplicationController
  def index
    @languages = Language.all
    @languages.sort! { |a, b| a.name.downcase <=> b.name.downcase }
  end

  def create
    translator = BingTranslator.new('jemaf', 'RYpFKXu5O/Q5/mAZ/KAfbx+LdUSWNorD6hjPEduzkVg=')
    text = params[:translation_text]
    lang = params[:languages]

    if text.present?
      file_name = "audio/" + Time.now.to_i.to_s + ".mp3"
      audio = translator.speak "#{text}", :language => "#{lang}", 
            :format => 'audio/mp3', :options => 'MaxQuality'
      open(file_name, 'wb') { |f| f.write audio }
      send_file file_name
    else
      flash[:error] = t("flash.tts.no_message")
      redirect_to root_path
    end
  end
end
