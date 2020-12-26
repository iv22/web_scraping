class WebCrumb
  attr_reader :body
  attr_reader :url

  def initialize(body, url)
    @body = body
    @url = url
  end
end