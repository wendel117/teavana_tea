class TeavanaTeas::Scraper
  
  def self.scrape_tea_urls
    doc = Nokogiri::HTML(open("https://www.teavana.com/craft-iced-tea/"))
    teas = doc.css("div.tea-bottle-container")
    teas.each do |tea|
      url = tea.css("a.tea-bottle-cta.cta-img").attr("href").value
      name = tea.css("h2.tea-bottle-title")[1].text.strip
      tea = TeavanaTeas::Teas.new(name, url)
    end
  end
  
  def self.scrape_tea_details(tea)
    doc = Nokogiri::HTML(open(tea.url))
    details = doc.css("div.hero-section-info_content")
    details.each do |details|
      details = TeavanaTeas::Details.new(details.h4.text, details.p.text.strip)
    tea.tea_details << self 
    binding.pry
    end
  end
end