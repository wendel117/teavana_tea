class TeavanaTeas::CLI 
  
  def call
  puts "Hello World"
  scrape
  hello
  end
  
  def scrape 
    TeavanaTeas::Scraper.scrape_teas
  end
  
  def hello
    tea = TeavanaTeas::Teas.all
    puts "#{tea}"
  end
end