class WebCrumb
  attr_reader :body
  attr_reader :url
  attr_reader :actual_date

  def initialize(body, url, actual_date)
    @body = body
    @url = url
    @actual_date = actual_date
  end
end
