class Admin::LiveblogController < ApplicationController
  
  def index
    @liveblog_pages = LiveblogPage.find(:all)
  end
  
  def new
    @liveblog_page = LiveblogPage.new
  end
  
  def edit
    @liveblog_page = LiveblogPage.find(params[:id])
  end
  
  def create
    @archive_page = Page.find(:first, :conditions => "class_name = 'LiveblogArchivePage'")
    @layout = Layout.find(:first, :conditions => "name = 'LiveblogLayout'")
    @liveblog_page = LiveblogPage.new(params[:liveblog_page])
    @liveblog_page.layout_id = @layout.id
    @liveblog_page.parent_id = @archive_page.id
    @liveblog_page.title = params[:liveblog_page][:live_blog_title]
    if @liveblog_page.valid?
      @liveblog_page.save
      content = '<r:snippet name="liveblog-heading" /><r:snippet name="liveblog-content" />'
      PagePart.create!(:page_id => @liveblog_page.id, :name => 'body', :filter_id => '', :content => content)
      flash[:notice] = 'Your page was created successfully'
      redirect_to :action => :index and return
    end
    render :action => :new
  end
  
  def new_entry
    @liveblog_page = LiveblogPage.find(params[:id].to_i)
    @liveblog_entry_page = LiveblogEntryPage.new
    @layout = Layout.find(:first, :conditions => "name = 'LiveblogEntryLayout'")    
  end
  
  def create_entry
    if !request.post?
      redirect_to :action => :new_entry and return 
    end
    @entry = LiveblogEntryPage.new(params[:liveblog_entry_page])
    @liveblog_page = LiveblogPage.find(params[:liveblog_entry_page][:parent_id].to_i)
    @layout = Layout.find(:first, :conditions => "name = 'LiveblogEntryLayout'")
    
    if @entry.valid?
      flash[:notice] = "Your entry has been posted."
      @entry.save
      PagePart.create!(:page_id => @entry.id, :name => 'body', :filter_id => 'Markdown', :content => params[:content])
      redirect_to :action => :new_entry, :id => @liveblog_page.id and return 
    else
      render :action => :new_entry, :id => @liveblog_page.id
    end
  end
  
end