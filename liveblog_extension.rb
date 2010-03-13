# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class LiveblogExtension < Radiant::Extension
  version "1.0"
  description "Adds basic LiveBlogging support to your Radiant installation."
  url "http://ryanstenhouse.eu/projects/radiant-liveblog-extension"

   define_routes do |map|
     map.namespace :admin, :member => { :remove => :get } do |admin|
       admin.resources :liveblog
     end
     map.connect '/admin/liveblog/:action/:id', :controller => 'admin/liveblog'       
   end
  
  def activate
     tab 'Content' do
       add_item "Liveblog", "/admin/liveblog", :after => "Pages"
     end
  end
end
