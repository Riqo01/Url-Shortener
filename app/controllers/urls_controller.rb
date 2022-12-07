class UrlsController < ApplicationController
  def index
    @url_processors = UrlProcessor.all
  end

  def show
    @url_processor = UrlProcessor.find(params[:id])
  end

  def new
    @url_processor = UrlProcessor.new
  end

  def create
    @url_processor = UrlProcessor.new(pattern_params)
    
    if @url_processor.save
      redirect_to @url_processor
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  private
  def url_shortener_params
    params.require(:url_processor).permit(:url)
  end

end
