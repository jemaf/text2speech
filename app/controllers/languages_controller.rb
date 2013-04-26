class LanguagesController < ApplicationController
  def new
    @language = Language.new
  end

  def create
    @language = Language.new(params[:language])

    if @language.save
      flash.now[:notice] = t("flash.languages.create.notice")
      redirect_to languages_path
    else
      flash.now[:error] = t("flash.languages.create.error")
    end
  end

  def delete
    @language = Language.find(params[:id])
    @language.destroy

    flash[:info] = t("flash.languages.delete")
    redirect_to languages_path
  end

  def index
    @languages = Language.all
  end
end
