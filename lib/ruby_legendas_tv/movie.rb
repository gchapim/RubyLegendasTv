class Movie
  attr_accessor :title, :description, :sinopsis, :image_link

  def initialize(title, description, sinopsis, image_link)
    @title = title
    @description = description
    @sinopsis = sinopsis
    @image_link = image_link
  end
end