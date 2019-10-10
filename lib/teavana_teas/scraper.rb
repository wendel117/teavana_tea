class TeavanaTeas::Scraper
  
  def self.scrape_teas
    doc = Nokogiri::HTML(open("https://www.teavana.com/craft-iced-tea/"))
    teas = doc.css("div.tea-bottle-container")
    teas.each do |tea|
      url = tea.css("a.tea-bottle-cta.cta-img").attr("href").value
      name = tea.css("h2.tea-bottle-title").text.strip
      tea = TeavanaTeas::Teas.new(name, url)
      #binding.pry
    end
  end
  
  def self.scrape_tea_details(tea)
    doc = Nokogiri::HTML(open(tea.url))
    details = doc.css("div.hero-section-info_content")
    details.each do |detail|
      detail = TeavanaTeas::Details.new
      
      detail.extra_info = doc.css("div.hero-section-info_content h2").text.strip
      detail.description = doc.css("div.hero-section-info_content p").text.strip
      
      tea.add_details(detail)
    
    end
  end
end