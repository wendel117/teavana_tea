class TeavanaTeas::CLI 
  
  def call
  puts "Hello World"
  scrape
  list_teas
  menu
  end
  
  def scrape 
    TeavanaTeas::Scraper.scrape_teas
  end
  
  def list_teas
    @teas = TeavanaTeas::Teas.all
    @teas.each.with_index(1) do |tea, i|
      puts "#{i}. #{tea.name}"
    end 
  end
  
  def show_tea_details(index)
    chosen_tea = @teas[index-1]
   
    TeavanaTeas::Scraper.scrape_tea_details(chosen_tea)
    puts "\n#{chosen_tea.details}"
    #binding.pry
  end
    
  
  def menu
    input = nil 
    while input != "exit"
    puts "\nEnter the number of the tea you'd like information about!"
    puts "(Enter list to view teas again or exit to leave at anytime)"
    input = gets.strip.downcase
    index = input.to_i
    
     if index.between?(1,9) 
        show_tea_details(index)
      elsif input == "list"
        list_teas
      elsif input == "exit"
        puts "\nThanks for stopping by!"
      else 
        puts "\nInvalid entry, please try again."
      end
    end
  end
  
end