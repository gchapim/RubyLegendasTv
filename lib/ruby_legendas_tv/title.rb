class Title
  attr_accessor :name, :description, :image_url, :link, :id

  def initialize(name, description, image_url, link)
    @name = name
    @description = description
    @image_url = image_url
    @id = link.split('/').last.split(':').last
    @link = link
  end
end