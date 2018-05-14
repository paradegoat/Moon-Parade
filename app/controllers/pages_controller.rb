class PagesController < ApplicationController
  layout 'portfolio'
  def home
    @posts = Portfolio.all
  end

  def about
  end

  def contact
  end
end
