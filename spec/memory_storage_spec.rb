require 'minitest/autorun'
require 'memory_storage'

Item = Struct.new(:id, :name)

describe MemoryStorage do
  before do
    MemoryStorage.flush
  end

  let :item do
    Item.new 1, 'item name'
  end

  describe '::save' do
    before do
      MemoryStorage.save item
    end

    it 'stores the object' do
      MemoryStorage.storage[1].must_equal item
    end

    it 'overwrites object under the same key' do
      MemoryStorage.save Item.new(1, 'other item')
      MemoryStorage.storage[1].name.must_equal 'other item'
    end
  end

  describe '::find' do
    it 'retrieves the object under id' do
      MemoryStorage.save item
      MemoryStorage.find(1).must_equal item
    end

    it 'returns nil if there is no object under such key' do
      MemoryStorage.find(1).must_be_nil
    end
  end

  describe '::all' do
    it 'returns all stored object in an array' do
      MemoryStorage.save item
      MemoryStorage.all.must_equal [item]
    end

    it 'returns empty array if theres no objects in the store' do
      MemoryStorage.all.must_equal []
    end
  end

  describe 'includes enumerable' do
    before do
      MemoryStorage.save item
    end

    it 'can be injected' do
      MemoryStorage.inject(0) { |sum, item| sum + item.id }.must_equal 1
    end
  end
end
