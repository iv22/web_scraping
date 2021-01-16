require_relative './web_content'

class OnlinerNews < WebContent

  attr_reader :start_date
  attr_reader :end_date

  BASE_URI = 'https://people.onliner.by'  

  def self.resource
    'people.onliner.by'
  end

  def initialize(start_date_str, end_date_str)
    begin
      @start_date = Date.parse(start_date_str)
      @end_date = Date.parse(end_date_str)
    rescue Date::Error
      raise(Date::Error, "Invalid date format")
    end 
    raise(Date::Error, "Invalid date interval") if start_date > end_date
    
    @result_links = []
  end

  def test_scraping
    p get_data
  end

  private

  def result_count
    150
  end

  def get_data
    start_date.upto(end_date) do |date|
      date_part_url = [date.year, format('%02d', date.month), format('%02d', date.day)].join('/')
      fill_links(BASE_URI + '/' + date_part_url, date)
    end
    @result_links
  end

  def fill_links(url, actual_date)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.xpath("//a[contains(@class,'news-tidings__link')]").each do |link|
      @result_links << {url: (BASE_URI + link['href']), actual_date: actual_date}
    end
  rescue Errno::ENOENT, SocketError 
    raise StandardError("URI unreachable: " + url)
  end

  def open_link(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    author = doc.xpath("//div[contains(@class,'news-header__author')]").first.text
    description = doc.xpath("//div[contains(@class,'news-text')]//p").text
    score = calc_textmood(description)   
    result = { "author" => author, "text_mood" => score, "words_frequency" => {} }
    words = description.tr(",./","   ").split(' ')
    words.each do |word| 
      result["words_frequency"][word.downcase] ||= 0
      result["words_frequency"][word.downcase] += 1
    end  
    result
  rescue Errno::ENOENT, SocketError 
    raise StandardError("URI unreachable: " + url)
  end

  def calc_textmood(text)
    tm = TextMood.new(language: "ru")
    tm.analyze(text)
  end
end