class PagesController < ApplicationController
  def home; end

  def about; end

  def projects
    @posts =  ProjectPost.where(locale: I18n.locale.to_s).order(created_at: :desc)
  end

  def blog
    @posts =  BlogPost.where(locale: I18n.locale.to_s).order(created_at: :desc)
  end

  def contact; end

  def zdrava_ishrana; end

  def nutrition; end
end
