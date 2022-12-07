class CsvfileController < ApplicationController
  require 'csv'

  def index
    if user_signed_in?
      @csvuploads = Csvupload.all
    else
      redirect_to :action => 'new', :controller=>"devise/sessions"        
    end
  end

  def show
    # @shortlink = Shortlink.(params[:id])
    #  @csvuploads = Csvupload.where("shorturl = ?", params[:id]).first
    redirect_to "https://www.google.com", allow_other_host: true
    
  end

  def import_links
   

      @csvupload = Csvupload.new()
      @csvupload.name = params[:csvfiletag].original_filename
      @csvupload.path = params[:csvfiletag].path
      @csvupload.rowcount = 0
      @csvupload.processed = false

    if @csvupload.save
      
    else
      render :new, status: :unprocessable_entity
    end

    CSV.foreach(params[:csvfiletag].path, headers: true) do |row|
      @csvupload = Shortlink.new()
      @csvupload.url = row["LongUrl"].to_s
      

    if @csvupload.save
      ShortUrlGeneratorJob.perform_later(@csvupload.id)
    else
      render :new, status: :unprocessable_entity
    end
  
        # puts "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKk" + row["Period"].to_s
      
      
    end
    

    redirect_to root_path

  end

  def import_csv
    # @shortlink = Shortlink.(params[:id])
    #  @shortlink = Shortlink.where("shorturl = ?", params[:id]).first
    redirect_to "https://www.google.com", allow_other_host: true
    
  end
 
  def new
    @shortlink = Csvupload.new
    @csv = ''
  end

  def create
    @csvupload = Csvupload.new(csvupload_params)
    if @csvupload.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
