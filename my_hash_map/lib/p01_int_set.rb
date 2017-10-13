class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = 20
  end

  def insert(num)
    bucket_idx = num % @num_buckets
    @store[bucket_idx] << num
  end

  def remove(num)
    bucket_idx = num % @num_buckets
    @store[bucket_idx].delete(num)
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_num = num % num_buckets
    @store[bucket_num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    #reassign @store to something longer
    old_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |old_bucket|
      old_bucket.each do |num|
        self[num] << num
      end
    end
  end
end
