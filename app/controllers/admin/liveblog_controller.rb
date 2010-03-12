class Admin::LiveblogController < ApplicationController
  
  def index
    @liveblog_pages = LiveblogPage.find(:all)
  end
  
  def new
  end
  
  def new_entry
    @liveblog_page = params[:id].to_i
  end
  
  def create_entry
    if !request.post?
      redirect_to :action => :new_entry and return 
    end
    @entry = LiveblogEntry.new
    @entry.content = params[:liveblog_entry][:content]
    @entry.liveblog_page_id = params[:liveblog_entry][:liveblog_page_id].to_i
    if @entry.valid?
      flash[:notice] = "Your entry has been posted."
      redirect_to :action => :new_entry and return 
    end
  end
  
end