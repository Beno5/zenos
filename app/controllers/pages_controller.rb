class PagesController < ApplicationController
  def home; end

  def about; end

  def projects
    @posts =  ProjectPost.where(locale: I18n.locale.to_s).order(date_of_post: :desc)
  end

  def blog
    @posts =  BlogPost.where(locale: I18n.locale.to_s).order(date_of_post: :desc)
  end

  def education_training; end

  def contact; end

  def zdrava_ishrana; end

  def nutrition; end

  def landing; end

  def talent_management; end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
