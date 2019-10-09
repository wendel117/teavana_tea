class TeavanaTeas::CLI 
  
  def call
  puts "Hello World"
  scrape
  hello
  end
  
  def scrape 
    TeavanaTeas::Scraper.scrape_tea_urls
  end
  
  def hello
    tea = TeavanaTeas::Teas.all
    tea.each.with_index do |tea, i|
    puts "#{i}. #{tea.name}"
    end
  end
end