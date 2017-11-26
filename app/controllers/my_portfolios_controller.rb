class MyPortfoliosController < ApplicationController

  def index
    @portfolio_items = MyPortfolio.all
  end

  def new
    @portfolio_items = MyPortfolio.new
  end

  def create
    @item = MyPortfolio.create!(params.require(:my_portfolio).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @item.save
        format.html { redirect_to my_portfolios_path, notice: 'Item created.'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = MyPortfolio.find(params[:id])
  end

  def update
    @portfolio_item = MyPortfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:my_portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to my_portfolios_path, notice: 'Item created.'}
      else
        format.html { render :new }
      end
    end
  end

end
