class TeavanaTeas::CLI 
  
  def call
    welcome
    intro
    menu
  end
  
  def welcome 
    puts "*******Welcome to the Teavana Tea Selector!*******"
  end
  
  def intro
    puts "\nEnter GO to see the list of our Craft Iced Teas."
    input = gets.strip.downcase
    if input == "go"
      scrape
      list_teas
    else 
      puts "Invaid entry."
      intro
  end
end
  
    
  def scrape 
    TeavanaTeas::Scraper.scrape_teas
  end
  
  def list_teas
    puts "\n"
    @teas = TeavanaTeas::Teas.all
    @teas.each.with_index(1) do |tea, i|
      puts "#{i}. #{tea.name.gsub(/\s+/, '').gsub(/(?<=[a-z])(?=[A-Z])/, ' ')}"
    end 
  end
  
  def show_tea_details(index)
    @chosen_tea = @teas[index-1]

    TeavanaTeas::Scraper.scrape_tea_details(@chosen_tea)
    @chosen_tea.details.each do |detail|
    puts "\n-----------------------------------------------------"
    puts "#{@chosen_tea.name.gsub(/\s+/, '').gsub(/(?<=[a-z])(?=[A-Z])/, ' ')} #{detail.extra_info.downcase}:"
    puts "\n#{detail.description}"
    puts "-----------------------------------------------------"
    end
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