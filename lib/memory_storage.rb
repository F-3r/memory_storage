class MemoryStorage
  VERSION = '0.0.1'

  extend Enumerable
  @@storage = {}

  class << self
    def save(object, identifier_method = :id)
      @@storage[object.send identifier_method] = object
    end

    def find(identifier)
      @@storage[identifier]
    end

    def all
      @@storage.values
    end

    def each(&block)
      @@storage.each {|k,object| block.call(object) }
    end

    def backend=(storage)
      @@storage = storage
    end
  end
end
