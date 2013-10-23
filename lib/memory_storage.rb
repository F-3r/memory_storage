class MemoryStorage
  VERSION = '0.0.1'

  extend Enumerable

  class << self
    def save(object, identifier_method = :id)
      storage[object.send identifier_method] = object
    end

    def find(identifier)
      storage[identifier]
    end

    def flush
      @storage = {}
    end

    def all
      storage.values
    end

    def each(&block)
      storage.each {|k,object| block.call(object) }
    end

    def storage
      @storage ||= {}
    end
  end
end
