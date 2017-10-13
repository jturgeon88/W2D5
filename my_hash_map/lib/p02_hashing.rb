class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_machine = {
      1 => 12,
      2 => 20,
      3 => 25,
      4 => 6,

    }

    counter = 10
    ("a".."z").each do |char|
      counter += 1
      hash_machine[char] = counter
    end
    id = ""
    self.each do |el|
      id += hash_machine[el].to_s
    end
    id.to_i
  end
end

class String
  def hash
    self.downcase.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    id = 0
    self.each do |k, v|
      id += v.hash
    end
    id
  end
end
