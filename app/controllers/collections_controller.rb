class CollectionsController < ApplicationController
  layout 'portfolio'
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @portfolio_items = @collection.portfolios.by_position
  end

end
