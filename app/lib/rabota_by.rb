require_relative './web_content'

class RabotaBy < WebContent
  attr_reader :base_uri

  BASE_URI = 'https://rabota.by/search/vacancy?area=1002&fromSearchLine=true&st=searchVacancy&text='
  RUBY_KEYWORD = 'ruby'

  def self.resource
    'rabota.by'
  end

  def initialize(keyword = RUBY_KEYWORD)
    @base_uri = BASE_URI + keyword
  end

  def test_scraping
    open_vacation('https://rabota.by/vacancy/41075753?query=ruby')
  end

  private
    def result_count
      250
    end

    def get_data(url = base_uri, result_links = [])
      html = URI.open(url)
      doc = Nokogiri::HTML(html)
      doc.xpath('//a[@data-vacancy-id]').each do |link|
        result_links << { url: link['href'], actual_date: get_actual_date }
      end
      get_data('https://rabota.by' + doc.xpath("//a[contains(@data-qa, 'pager-next')]").first['href'], result_links) \
        if doc.xpath("//a[contains(@data-qa, 'pager-next')]").count == 1 && result_links.size < result_count
      result_links
    rescue Errno::ENOENT, SocketError
      raise StandardError('URI unreachable: ' + url)
    end

    def open_link(url)
      html = URI.open(url)
      doc = Nokogiri::HTML(html)
      company_name = doc.xpath("//a[contains(@data-qa,'vacancy-company-name')]").first.text
      result = { 'company' => company_name, 'words_frequency' => {} }
      description = doc.xpath("//div[contains(@data-qa,'vacancy-description')]").text
      words = description.tr(',./', '   ').split(' ')
      words.each do |word|
        result['words_frequency'][word.downcase] ||= 0
        result['words_frequency'][word.downcase] += 1
      end
      result
    rescue Errno::ENOENT, SocketError
      raise StandardError('URI unreachable: ' + url)
    end
end
