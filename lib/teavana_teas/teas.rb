class TeavanaTeas::Teas
  attr_accessor :name, :url, :details, :description
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @details = []
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_details(details)
    self.details << details
  end
  # def name
  #   @name ||= doc.css("div.hero-section-info h1").text
  # end

  # def doc
  #   @doc ||= Nokogiri::HTML(open(self.url))
  # end

end