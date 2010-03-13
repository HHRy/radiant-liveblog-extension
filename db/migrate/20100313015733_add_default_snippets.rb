class AddDefaultSnippets < ActiveRecord::Migration
  def self.up
    s = Snippet.new(:name => 'liveblog-heading')
    s.content = <<-HTML
    <h2><r:liveblog:live_blog_title /></h2>
    <div class="details">
      <p class="created">
        Created <strong><r:date /></strong> by <strong><r:author /></strong>
      </p>
      <p class="description">
        <r:liveblog:live_blog_description />
      </p>
    </div>
    HTML
    s.save
  
    s = Snippet.new(:name => 'liveblog-content')
    s.content = <<-HTML
    <ul class="liveblogContent">
      <r:children:each  order="desc">
      <li>
        <strong><r:date format="%H:%M" /></strong>: <r:content />
      </li>
      </r:children:each>
    </ul>
    HTML
    s.save
    
  end

  def self.down
  end
end
