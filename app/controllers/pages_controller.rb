class PagesController < ApplicationController
  def home; end

  def about; end

  def projects; end

  def blog
    @posts = BlogPost.all
  end

  def contact; end
end
