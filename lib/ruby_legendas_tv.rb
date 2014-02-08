require 'rubygems'
require 'nokogiri'
require 'open-uri'

load 'lib/ruby_legendas_tv/home_parser.rb'
load 'lib/ruby_legendas_tv/movie.rb'
load 'lib/ruby_legendas_tv/search_engine.rb'
load 'lib/ruby_legendas_tv/subtitle.rb'
load 'lib/ruby_legendas_tv/title.rb'
load 'lib/ruby_legendas_tv/website_utils.rb'

class RubyLegendasTv

  @@base_url = "http://legendas.tv/"

  public

  def self.search_titles(query)
    SearchEngine.search_title(@@base_url, query)
  end

  def self.search_subtitles_from_title(title)
    Subtitle.get_subtitles_from_title(@@base_url, title)
  end

  def self.search_subtitles(query)
    SearchEngine.search_subtitle(@@base_url, query)
  end

  def self.get_most_downloaded_subtitles
    HomeParser.get_most_downloaded_subtitles(@@base_url)
  end

  def self.get_highlights(page=1)
    HomeParser.get_highlights(@@base_url, page)
  end
end