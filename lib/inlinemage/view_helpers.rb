module Inlinemage
  module ViewHelpers
    
    def image_tag( source, options={} )
       #ActionView::Helpers::AssetTagHelper::image_tag( source, options )
       path = source[0...1] == "/" ? "#{RAILS_ROOT}/public/#{source}" : "#{RAILS_ROOT}/public/images/#{source}"
    
       source_parts = source.split( "." )
       extension = source_parts[source_parts.size-1]
    
       f = File.open( path, "rb" )
       data = f.read
       f.close
    
       encoded = Base64.encode64( data ).strip
    
       if options[:size]
         size_parts = options[:size].split( "x" )
         valid_size = size_parts.size == 2 ? true : false
         if valid_size
           width = size_parts[0]
           height = size_parts[1]
         end
       end
    
       html = "<img src=\"data:image/#{extension};base64,#{encoded}\" "
       html << "alt=\"#{options[:alt]}\" " if options[:alt]
       html << "width=\"#{width}\" height=\"#{height}\" " if valid_size
       html << "class=\"#{options[:class]}\" " if options[:class]
       html << "id=\"#{options[:id]}\" " if options[:id]
       html << "onmouseover=\"this.src='#{options[:mouseover]}'\" " if options[:mouseover]
       html << "/>"
       return html
     end
    
  end
end