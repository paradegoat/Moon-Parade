class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  layout 'collections'
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @portfolio_items = @collection.portfolios
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find(params[:id])
   end


  def create
    @collection = Collection.new(collection_params)
    respond_to do |format|
      if @collection.save
        format.html { redirect_to collections_url, notice: 'Collection was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collections_path, notice: 'The photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully removed.' }
    end
  end


  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:title, :main_image)
    end

end
