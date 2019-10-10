class TeavanaTeas::Teas
  attr_accessor :name, :url, :details
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @details = []
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_details(details)
    self.details << details
  end
 

end