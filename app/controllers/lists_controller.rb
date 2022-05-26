class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @reviews = @restaurant.reviews
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save == true
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
