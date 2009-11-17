$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'inlinemage/view_helpers'

module Inlinemage
  VERSION = '0.0.1'
end

ActionView::Base.send( :include, Inlinemage::ViewHelpers ) if defined?( ActionView::Base )