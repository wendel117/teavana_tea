class TeavanaTeas::Teas
  attr_accessor :name :url :extra_detail :description
  @@all = []
  
  def initialize(name)
    @name = name 
    @description = description
    @extra_detail = extra_detail
    @@all << self
  end
  
end