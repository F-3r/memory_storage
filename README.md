# MemoryStorage

A very simple in memory storage utility class.

## Installation

Add the gem to your Gemfile

```ruby
gem 'memory_storage'
```

## Usage

The only requirement to store objects with MemoryStorage is that persistent
objects must respond to `#id`

Examples:
 
```ruby
class Item
  attr_accessor :id, :name, :amount

  def initialize(id, name, amount)
    @id = id
    @name = name
    @amount = amount
  end
end

item = Item.new(1, 'Item one', 10)

# saving an object
MemoryStorage.save(item)

# retrieving object by id
MemoryStorage.find(1) #=> <Item @id: 1 @name: 'Item one' @amount: 10>

# retrieving all stored objects
MemoryStorage.all #=> [<Item @id: 1 @name: 'Item one'  @amount: 10>]
```

## Enumerable

MemoryStorage includes Enumerable, so every method defined in Enumerable can be
used:

```ruby
MemoryStorage.save(Item.new(1,'one', 1))
MemoryStorage.save(Item.new(2,'one', 2))
MemoryStorage.save(Item.new(3,'one', 3))

MemoryStorage.inject(0) {|sum, item| sum + item.amount } #=> 6
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/F-3r/memory_storage/blob/master/LICENSE).
