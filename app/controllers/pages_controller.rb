class PagesController < ApplicationController
  def home; end

  def about; end

  def projects
    @posts =  ProjectPost.all.select { |post| post.locale == I18n.locale.to_s }
  end

  def blog
    @posts =  BlogPost.all.select { |post| post.locale == I18n.locale.to_s }
  end

  def contact; end

  def zdrava_ishrana; end

  def nutrition; end
end
