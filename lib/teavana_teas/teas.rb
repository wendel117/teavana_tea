class TeavanaTeas::Teas
  attr_accessor :name, :url, :extra_detail, :description
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @tea_details = []
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_details(details)
    self.tea_details << details
    details.tea = self
  end
  # def name
  #   @name ||= doc.css("div.hero-section-info h1").text
  # end

  # def doc
  #   @doc ||= Nokogiri::HTML(open(self.url))
  # end

end