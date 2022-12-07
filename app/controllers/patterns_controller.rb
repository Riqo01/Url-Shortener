class PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
  end

  def show
    @pattern = Pattern.find(params[:id])
  end

  def new
    @pattern = Pattern.new
  end

  def create
    @pattern = Pattern.new(pattern_params)
    
    if @pattern.save
      redirect_to @pattern
    else
      render :new, status: :unprocessable_entity
    end
  end

  def no_randomization
    shortString = ''
      while 1..6
        randomNo = rand(1..10)
        shortString = shortString + randomNo.chr
      end
    return shortString
  end

  private
    def pattern_params
      params.require(:pattern).permit(:format, :lastPatternUsed)
    end
  
 
end


