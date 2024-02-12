class PagesController < ApplicationController
  def home; end

  def about; end

  def projects
    @posts = ProjectPost.all
  end

  def blog
    debugger
    @posts = BlogPost.all
  end

  def contact; end

  def zdrava_ishrana

  end

  def nutrition
  end
end
