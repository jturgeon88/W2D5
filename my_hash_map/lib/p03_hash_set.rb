require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end


  def insert(key)
    key = key.hash
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def include?(key)
    key = key.hash
    @store.flatten.include?(key)
  end

  def remove(key)
    key = key.hash
    self[key].delete(key)
  end

  private

  def [](num)
    bucket_num = num % num_buckets
    @store[bucket_num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |old_bucket|
      old_bucket.each do |num|
        self[num] << num
      end
    end
  end
end
