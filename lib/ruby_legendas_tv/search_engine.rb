require 'uri'

class SearchEngine
  def self.search_subtitle(base_url, query, page=1)
    unless query.nil?
      query = URI.escape(query)
      link = 'util/carrega_legendas_busca/termo:' + query
      if page != 1
        link = link + '/page:' + page
      end
      document = WebsiteUtils.open_document(base_url+link)
      unless document.nil?
        subtitles = Array.new
        urls = WebsiteUtils.get_article_urls(document)
        urls.each_pair do |url, language|
          subtitle = Subtitle.get_subtitle_from_link(base_url, url, language)
          subtitles.push(subtitle)
        end
        subtitles
      end
    end
  end

  def self.search_title(base_url, query)
    unless query.nil?
      query = URI.escape(query)
      link = 'busca?q=' + query

      document = WebsiteUtils.open_document(base_url+link)
      unless document.nil?
        titles = Array.new
        items_div = document.css('div.slider').children.css('div.item')
        items_div.each{|link|
          url = link.css('a').attr('href').text
          img_url = link.css('img').attr('src').text
          name = link.css('span').text
          description = link.css('p').text

          title = Title.new(name, description, img_url, url)
          titles.push(title)
        }
        titles
      end
    end
  end
end