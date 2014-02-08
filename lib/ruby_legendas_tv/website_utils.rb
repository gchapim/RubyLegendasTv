require 'timeout'

class WebsiteUtils
  #Returns a hash where key is link and value is the language of subtitle
  def self.get_article_urls(document)
    unless document.nil?
      links = Hash.new
      items_div = document.css('div.gallery').css('article').children
      #puts items_div.inspect
      items_div.each{|link|
       links[link.css('a').attr('href').text] = link.css('img').attr('title')
      }
      links
    end
  end

  def self.open_document(url, tries=0)
    begin
      if tries > 3
        return nil
      else
        status = Timeout::timeout(30) {
          document = Nokogiri::HTML(open(url, "User-Agent" => "Chrome/15.0.874.121"))
          return document
        }
      end
    rescue Timeout::Error
      puts 'Timeout error... Trying again'
      document = open_document(url, tries+1)
      return document
    end
  end
end