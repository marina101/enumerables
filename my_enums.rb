#This program is my attempt to recreate the methods in the enumerable module

module Enumerable
  
  def my_each
    return self unless block_given?
    index = 0
    until index == (self.length)
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    return self unless block_given?
    index = 0
    until index == (self.length-1)
      yield(self[index], index)
      index +=1
    end
    self
  end  

  def my_select
  return self unless block_given?
  index = 0
  array = []
  until index ==(self.length-1)
    if yield(self[index])
      array.push(self[index])
    end
    index +=1
  end
  array
  end

  def my_all?
    all = true
    if block_given?
      index = 0
      while index < self.length
        if !yield(self[index])
          all = false
        end
        index += 1
      end
      all
    else
      all unless !self
    end
  end

  def my_any? 
    if block_given?
      my_each {|x| return true if yield(x)}
    else
      my_each {|x| return true if x}
    end 
    false
  end

  def my_none?
    if block_given?
      my_each {|x| return true if !yield(x)}
    else
      return true if !self
    end
    false
  end

  def my_count
    count = 0
    if block_given?
      my_each {|x| count += 1 if yield(x)}
    else
      my_each {|x| count += 1}
    end
    count
  end

  def my_map
    array = []
    if block_given?
      my_each {|x| array.push(yield(x))}
      return array
    else
      return self
    end
  end

  def my_inject(start = nil)
    self.my_each do |x| 
      if start
        start = yield(start, x)
      else
        start = x
      end
    end
    return start
  end
end


