class ShortlinksController < ApplicationController
  require 'csv'

  def index

    if user_signed_in?
      @shortlinks = Shortlink.all    
      @baseurl = request.original_url
      
    else
      redirect_to :action => 'new', :controller=>"devise/sessions"        
    end
  end

  def show
    # @shortlink = Shortlink.(params[:id])
     @shortlink = Shortlink.where("shorturl = ?", params[:id]).first
     if @shortlink.expiry_date != nil && @shortlink.expiry_date < DateTime.now()      
      render :new, status: :unprocessable_entity 
     else
      @shortlink.visit_count += 1
      @shortlink.save!
      redirect_to "#{@shortlink.url}", allow_other_host: true
     end
    
  end

  def import_links

    csv1 = CSV.foreach(params[:bank].path, headers: true) do |row|

      @csvfile = Csvupload.new(shortlink_params)
      @csvfile.name = params[:bank].original_filename
      @csvfile.path = params[:bank].path
      @csvfile.rowcount = 0
      @csvfile.processed = false

    if @csvfile.save
      redirect_to :action => 'index'
    else
      render :new, status: :unprocessable_entity
    end

        # puts "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKk" + row["Period"].to_s
      
      
    end
    
    redirect_to "https://www.google.com", allow_other_host: true

  end


  def import_csv
    # @shortlink = Shortlink.(params[:id])
    #  @shortlink = Shortlink.where("shorturl = ?", params[:id]).first
    redirect_to "https://www.google.com", allow_other_host: true
    
  end
 
  def new
    @shortlink = Shortlink.new
  end

  def create
    @shortlink = Shortlink.new(shortlink_params)   
    if @shortlink.save
      ShortUrlGeneratorJob.perform_now(@shortlink.id)
      redirect_to :action => 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end  

  private
  def shortlink_params
    params.require(:shortlink).permit(:url, :expiry_date)
  end
end
