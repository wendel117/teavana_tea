class TeavanaTeas::Teas
  attr_accessor :name, :url, :extra_detail, :description
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all 
  end

end