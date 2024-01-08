# defining own operators

class Family
  def initialize
     @members = []
  end
 
  def <<(new_member)
      @members.push(new_member)
  end

   def [](index)
     @members[index]
   end

   def []=(index, new_member)
     @members[index] = new_member
   end
end