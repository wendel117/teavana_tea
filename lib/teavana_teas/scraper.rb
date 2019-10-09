class TeavanaTeas::Scraper
  
  def self.scrape_tea_urls
    doc = Nokogiri::HTML(open("https://www.teavana.com/craft-iced-tea/"))
    teas = doc.css("div.tea-bottle-container")
    teas.each do |tea|
      url = tea.css("a.tea-bottle-cta.cta-img").attr("href").value
      tea = TeavanaTeas::Teas.new(url)
    end
  end
  
  def self.scrape_tea_details(url)
    doc = Nokogiri::HTML(open(url))
    description = doc.css("p.custom-color").text
    
  
end