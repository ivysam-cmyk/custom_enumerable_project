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
      # if all the values return true, length of this array is the same as length of the original array 
      if array.length == self.length
        return true
      end
    end

    def my_any?
      #check for each element
      index = 0
      true_array = []
      while index < self.length
        if ((yield self[index]) == true)
          true_array << self[index]
        end
        index += 1
      end
      if true_array.length > 0 #if there is a single true element it will return true
        return true
      else
        return false #if the length is 0 then it returns false
      end
    end

    def my_none? #opposite of all.
      index = 0
      array = []
      while index < self.length
        # check the condition for every element in array.
        if ((yield self[index]) == true)
          return false
        else
          array << self[index] #the false array
        end 
        index += 1
      end
      # if all the values return false, length of this array is the same as length of the original array 
      if array.length == self.length
        return true 
      end
    end

    def my_count
      index = 0
      count_array = []
      if block_given?
        while index < self.length
          if (yield self[index]) == true
            count_array << self[index]
          end
          index += 1
        end
        return count_array.length
      else #block not given
        return self.length
      end
    end

    def my_map
      #take each value 
      index = 0
      map_array = []
      while index < self.length
        # pass to block
        # get the return value from the block
        # append to an array
        map_array << (yield self[index])
        index += 1
      end
      return map_array
      # return the array
    end

    def my_inject(init_val)
      #take each value 
      index = 0
      acc = init_val
      while index < self.length
        #accumulator is the first value
        #pass the accumulator and the each value to the block
        acc = yield(acc, self[index])  #this returns the new acc       
        index += 1
      end
      return acc
    end
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
