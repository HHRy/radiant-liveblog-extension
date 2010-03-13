#Radiant Liveblog Extension

This extension adds self-contained liveblogging support to RadiantCMS. It's
designed to have no external dependancies and should work just fine out of the
box on most Radiant installations.

Note: The development and most of the testing of this extension has been against
the yet-to-be-released version 0.9 of Radiant, however it should be compatible with
All 0.8 and higher installations.

##Installation Instructions

This extension is not yet registered with the Extensions repository, so for now simply
pull down this extension to ./vendor/extensions/liveblog; then:

<code>rake radiant:extensions:liveblog:migrate</code>

As well as the extra fields and associations needed for the liveblogging being created,
you'll also find two new snippets - liveblog-content and liveblog-heading. These are
used by the default layout to display your liveblog to your users.

Once the rake is complete, you will need to add an <tt>LiveblogArchive</tt> page
and two layouts, one called <tt>LiveblogLayout</tt> and the other, <tt>LiveblogEntryLayout</tt>

Recommended default content for these pages can be found in the assets directory of the 
extension. <tt>assets/add_post.png</tt> will need to be copied to <tt>public/images/admin</tt>.

##Usage

The extension adds a Liveblog tab to the Content section of the Admin UI.

Initially, there will be no Liveblogs defined on your site; so to create one; click on the
'Create New Liveblog' option at the bottom of the page.

On the resulting form, all fields are required for now. When you click the 'Create Liveblog Page'
button at the end of editing; you'll be returned to the Liveblog page. 

To Add posts, click on the 'Add Post' Button beside the liveblog you wish to update.

Liveblog posts are a special kind of kind of page and will be created as children of the LiveblogPage
you just updated. They (and LiveblogPages) are not cached, since that would defeat the purpose of
them being 'live'.

When you make a post, you will be returned to the form to make another - this is based on the premise
that you'll always want to have an update box in front of you so you can type your entries as quickly
as possible.

Liveblog entries are titled and slugged with a Time.now.to_i of the time they were created; and the bread-
crumb link is the same time, but rendered as %H;%M. They also have their own layout applied, so you can
link to them directly should you so wish.