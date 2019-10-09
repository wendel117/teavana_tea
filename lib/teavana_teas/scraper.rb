class TeavanaTeas::Scraper
  
  def self.scrape_teas
    doc = Nokogiri::HTML(open("https://www.teavana.com/craft-iced-tea/"))
    teas = doc.css("h2.tea-bottle-title").text.split
    teas.each do |name|
      tea = TeavanaTeas::Teas.new(name)
      #binding.pry
    end
  end
  
  
  
  
end