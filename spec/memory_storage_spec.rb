require 'minitest/autorun'
require 'memory_storage'

Item =  Struct.new(:id, :name)

describe MemoryStorage do
  before do
    MemoryStorage.backend = {}
  end

  describe '::save' do
    it 'stores the object' do
      storage = {}
      MemoryStorage.backend = storage
      item = Item.new 1,'name'

      MemoryStorage.save item

      storage[1].must_equal item
    end

    it 'overwrites object under the same key' do
      storage = { 1 => Item.new(1,'item')}
      MemoryStorage.backend = storage

      MemoryStorage.save Item.new 1,'other'

      storage[1].name.must_equal 'other'
    end
  end

  describe '::find' do
    it 'restrieves the object under id' do
      item = Item.new(1,'item')
      storage = { 1 => item }
      MemoryStorage.backend = storage

      MemoryStorage.find(1).must_equal item
    end

    it 'returns nil if theres no object under such key' do
      MemoryStorage.find(1).must_be_nil
    end
  end

  describe '::all' do
    it 'returns all stored object in an array' do
      one, two, three = Item.new(1,'one'), Item.new(2,'two'), Item.new(3,'three')
      storage = { 1 => one, 2 =>two, 3 => three }
      MemoryStorage.backend = storage

      MemoryStorage.all.must_equal [one, two, three]
    end

    it 'returns empty array if theres no objects in the store' do
      MemoryStorage.all.must_equal []
    end
  end

  describe 'includes enumerable' do
    it 'can be injected' do
      MemoryStorage.save(Item.new(1,'one'))
      MemoryStorage.save(Item.new(2,'one'))
      MemoryStorage.save(Item.new(3,'one'))

      MemoryStorage.inject(0) {|sum, item| sum + item.id }.must_equal 6
    end

  end

end
