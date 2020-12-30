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
  
  def catch_method(method)
    raise NotImplementedError, "Method #{method} must be implemented"
  end

  def get_data(_)
    catch_method(__method__)
  end

  def open_link(_)
    catch_method(__method__)
  end
end