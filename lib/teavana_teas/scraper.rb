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
    details = doc.css("div.hero-section-info_content")
    details.each do |details|
      details = TeavanaTeas::Details.new(details.h4.text, details.p.text.strip)
    
  
end