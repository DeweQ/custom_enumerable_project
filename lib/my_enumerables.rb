# Custom enumerable methods
module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...size do
      yield(self[i], i)
    end
    self
  end

  def my_all?
    my_each { |element| return false unless yield element }
    true
  end

  def my_any?
    my_each { |element| return true if yield element }
    false
  end

  def my_count
    return size unless block_given?

    counter = 0
    my_each { |element| counter += 1 if yield element }
    counter
  end

  def my_inject(result = nil)
    current = 0
    if result.nil?
      result = self[current]
      current += 1
    end
    for i in current...size do
      result = yield(result, self[i])
    end
    result
  end

  def my_map
    new_value = []
    my_each { |element| new_value << yield(element) }
    new_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
  end
end
