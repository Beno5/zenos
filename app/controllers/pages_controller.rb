class PagesController < ApplicationController
  def home; end

  def about; end

  def projects
    @posts = ProjectPost.all
  end

  def blog
    @posts = BlogPost.all
  end

  def contact; end
end
