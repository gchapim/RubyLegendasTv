class Subtitle
  attr_accessor :movie, :release, :date, :uploader, :download_num, :download_link, :likes, :unlikes, :description, :lang

  def initialize(movie, release, date, uploader, download_num, download_link, likes, unlikes, description, lang=nil)
    @movie = movie
    @release = release
    @date = date
    @uploader = uploader #not implemented yet
    @download_num = download_num
    @download_link = download_link
    @likes = likes #not implemented yet
    @unlikes = unlikes #not implemented yet
    @description = description
    @lang=lang
  end

  def self.get_subtitle_from_link(base_url, link, lang=nil)
    if link.nil?
      return nil
    else
      page = WebsiteUtils.open_document(base_url+link)
      if page.nil?
        return nil
      else
        info = page.css('div.middle').css('section.first')
        movie_title = info.css('h3').text
        movie_description = info.css('h5').text
        movie_sinopsis = info.css('div.t1').css('p').text
        movie_img = info.css('img').attr('src')

        movie = Movie.new(movie_title, movie_description, movie_sinopsis, movie_img)

        release = page.css('h2')[0].text
        date = page.css('span.date').text
        hour = page.css('span.hour').text
        if hour.nil?
          datetime=Date.new(date)
        else
          datetime = DateTime.strptime(date + ' ' + hour, '%d/%m/%Y %Hh%M')
        end
        download_num = page.css('span.number').text.to_i
        description = page.css('div.t2').css('p').text
        download_link = page.css('button.icon_arrow').attr('onclick').text
        download_link = download_link.gsub("window.open('", '')
        download_link = download_link.gsub("', '_self')", '')

        subtitle = Subtitle.new(movie, release, datetime, nil, download_num, download_link, nil, nil, description, lang)
        subtitle
      end
    end
  end

  def self.get_subtitles_from_title(base_url, title)
    link = title.link
    document = WebsiteUtils.open_document(base_url+link)
    unless document.nil?
      subtitles = Array.new
      urls = WebsiteUtils.get_article_urls(document)
      urls.each_pair do |url, language|
        subtitle = self.get_subtitle_from_link(base_url, url, language)
        subtitles.push(subtitle)
      end
      subtitles
    end
  end
end