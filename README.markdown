#NOT READY YET! Very Incomplete! Don't Use!


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

Once the rake is complete, you will need to add an Archive page called <tt>Liveblogs</tt>
and a layout called <tt>LiveblogLayout</tt> 

Recommended default content for these pages can be found in the assets directory of the 
extension; but if you'd rather accept the defaults and save you some effort:

<code>rake radiant:extensions:liveblog:load_defaults</code>

##Usage

Still to work out.