class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def new
   @portfolio_item = Portfolio.new
 end

 def create
   @portfolio_item = Portfolio.new(portfolio_params)

   respond_to do |format|
     if @portfolio_item.save
       format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def edit
  end

  def update


    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 def show
   @page_title = @portfolio_item.title
 end

 def destroy

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      :collection_id
                                     )
  end
end
