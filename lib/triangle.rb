require 'pry'
class Triangle
  attr_accessor :adjacent, :opposite, :hypot
  def initialize(adjacent, opposite, hypot)
    @adjacent = adjacent
    @opposite = opposite
    @hypot = hypot
  end

  def failCheck(bad_triangle)
    if(bad_triangle)
        raise TriangleError
      true
    else
      false
    end
  end

  def kind        
    
    bad_triangle = (@adjacent==0)||(@opposite==0)||(@hypot==0) ? true : false           
    failCheck(bad_triangle) ? return : nil

    bad_triangle = case @adjacent && @opposite && @hypot when nil then true else false end    
    failCheck(bad_triangle) ? return : nil
   
    bad_triangle = ((@adjacent + @opposite) <= @hypot) || ((@adjacent + @hypot) <= @opposite)  || ((@opposite + @hypot) <= @adjacent)   
    failCheck(bad_triangle) ? return : nil
    
    array = [@adjacent, @opposite, @hypot]
    sideMatches = array.group_by{|side| side}.count
    return case sideMatches
    when 3 then :scalene
    when 2 then :isosceles
    when 1 then :equilateral        
    end
  
  end

  class TriangleError < StandardError
    def message
      "Bad Triangle"
    end
  end

end
