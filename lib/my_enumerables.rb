module Enumerable
  # Your code goes here
    def my_each_with_index
      index = 0
      while index < self.length
        yield(self[index], index)
        index += 1
      end
      return self
    end

    def my_select
      #takes each value of array
      index = 0
      return_array = []
      while index < self.length
        #passing the value into the block 
        #how to check if it satisfies condition in the block? check return value of the block.
        if ((yield self[index]) == true)
          #if it does add it to the array being returned
          return_array << self[index]
        end
        index += 1
      end
      return return_array
      #if it does not, do nothing
    end

    def my_all?
      index = 0
      array = []
      while index < self.length
        # check the condition for every element in array.
        if ((yield self[index]) == false)
          return false
        else
          array << self[index]
        end 
        index += 1
      end
      # if all the values return true length of this array is the same as length of the original array 
      if array.length == self.length
        return true
      end
    end

    def 
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0
    while index < self.length
      yield (self[index]) #executes the block for each element  
      index +=1 
    end
    return self # should return the original array no matter the contents of the block
  end

end
