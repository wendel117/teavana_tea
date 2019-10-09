class TeavanaTeas::CLI 
  
  def call
  puts "Hello World"
  scrape
  hello
  end
  
  def scrape 
    TeavanaTeas::Scraper.scrape_tea_urls
    TeavanaTeas::Scraper.scrape_tea_details
  end
  
  def hello
    tea = TeavanaTeas::Teas.all
    tea.each.with_index do |tea, i|
    puts "#{i}. #{tea.url}"
    TeavanaTeas::Scraper.scrape_tea_details
    end
  end
end