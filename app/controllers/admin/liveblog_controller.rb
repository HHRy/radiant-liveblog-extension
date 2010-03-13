class Admin::LiveblogController < ApplicationController
  
  def index
    @liveblog_pages = LiveblogPage.find(:all)
  end
  
  def new
    @liveblog_page = LiveblogPage.new
  end
  
  def create
    @archive_page = Page.find(:first, :conditions => "title = 'Liveblogs' AND class_name = 'ArchivePage'")
    @layout = Layout.find(:first, :conditions => "name = 'LiveblogLayout'")
    @liveblog_page = LiveblogPage.new(params[:liveblog_page])
    @liveblog_page.layout_id = @layout.id
    @liveblog_page.parent_id = @archive_page.id
    @liveblog_page.title = params[:liveblog_page][:live_blog_title]
    if @liveblog_page.valid?
      @liveblog_page.save
      flash[:notice] = 'Your page was created successfully'
      redirect_to :action => :index and return
    end
    render :action => :new
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