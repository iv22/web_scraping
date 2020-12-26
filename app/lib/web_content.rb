require 'open-uri'
require 'nokogiri'
require_relative './web_crumb'

class WebContent
  
  include Enumerable

  def self.resource
    'anonymous'
  end

  def each
    get_data.each_with_index do |url, i| 
      yield WebCrumb.new(open_link(url), url) if i < result_count      
    end
  end

  private
  
  def result_count
    2
  end

  def get_data(_)
    raise NotImplementedError, "Method #{__method__} must be implemented"
  end

  def open_link(_)
    raise NotImplementedError, "Method #{__method__} must be implemented"
  end
end