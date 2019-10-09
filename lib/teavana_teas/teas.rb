class TeavanaTeas::Teas
  attr_accessor :name, :url, :extra_detail, :description
  @@all = []
  
  def initialize(url)
    @url = url
    @tea_details = []
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def get_details
    TeavanaTeas::Scraper.scrape_tea_details(self) if @tea_details.empty?
  end 
  # def name
  #   @name ||= doc.css("div.hero-section-info h1").text
  # end

  # def doc
  #   @doc ||= Nokogiri::HTML(open(self.url))
  # end

end