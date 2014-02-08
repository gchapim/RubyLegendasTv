class HomeParser
  def self.get_most_downloaded_subtitles(base_url)

    document = WebsiteUtils.open_document(base_url)

    subtitles = Array.new
    items_div = document.css('div.item').children
    items_div.each{|link|
      #puts link['href']
      subtitle = Subtitle.get_subtitle_from_link(base_url, link['href'])
      subtitles.push(subtitle)
    }
    subtitles
  end

  def self.get_highlights(base_url, page=1)
    link = 'util/carrega_destaques'
    if page != 1
      link = link+'/todos/page:' + page.to_s
    end
    document = WebsiteUtils.open_document(base_url+link)

    unless document.nil?
      subtitles = Array.new
      items_div = document.css('div.galery').css('div.clearfix').children
      items_div.each{|link|
        unless link.nil?
          a = link.children.css('a')
          unless a.nil? || a.empty?
            href = a.attr('href')
            subtitle = Subtitle.get_subtitle_from_link(base_url, href)
            subtitles.push(subtitle)
          end
        end
      }
      subtitles
    end
  end
end