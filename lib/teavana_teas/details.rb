class TeavanaTeas::Details 
  attr_accessor :extra_info, :description, :tea
  @@all = []
  
  def initialize(extra_info, description)
    @extra_info = extra_info
    @description = description
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  
end