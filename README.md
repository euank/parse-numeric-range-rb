# Parse Numeric Range

Parses expressions like 1-10,20-30. Returns an energetic (as opposed to lazy) array.

## Usage

```ruby
require 'parse_numeric_range'

ParseNumericRange.parse("1,3..5")
# => [1, 3, 4, 5]
```

## TODO

* return a lazy enumerator
