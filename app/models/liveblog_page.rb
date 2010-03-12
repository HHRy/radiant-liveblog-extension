class LiveblogPage < Page
  validates_presence_of :live_blog_title
  validates_presence_of  :live_blog_description
  validates_presence_of  :live_blog_event_uri
  has_many :liveblog_entries
end
