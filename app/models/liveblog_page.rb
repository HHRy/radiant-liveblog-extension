class LiveblogPage < Page
  validates_presence_of :live_blog_title
  validates_presence_of  :live_blog_description
  validates_presence_of  :live_blog_event_uri
  has_many :liveblog_entries
  
    desc %{ 
      *Usage:*
      <r:liveblog>...</r:liveblog>
    }
    tag 'liveblog' do |tag|
      tag.locals.liveblog = tag.globals.page
      tag.expand
    end

    [:live_blog_title, :live_blog_description, :live_blog_event_uri].each do |method|
      desc %{
        Renders the @#{method}@ attribute of the current liveblog.
      }
      tag "liveblog:#{method}" do |tag|
        tag.locals.liveblog.send("#{method}")
      end
    end
  
    desc "Gives us the entries associated with this liveblog"
    tag 'liveblog:entries' do |tag|
    end
  
end
