class LinksController < ApplicationController
  def index
    @links = Link.all
  end
  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(url: "...", shorturl: "...")
    
    if @link.save
      redirect_to @link
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def link_params
    params.require(:link).permit(:url)
  end
end
