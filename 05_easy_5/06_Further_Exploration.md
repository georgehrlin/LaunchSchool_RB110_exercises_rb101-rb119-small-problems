# FURTHER EXPLORATION

Q: Take some time to read about Hash::new to learn about the different ways to initialize a hash with default values.

A:
```
new(default value = nil, capacity: 0) → new_hash
new(capacity: 0) {|self, key| ...} → new_hash
```
Returns a new empty Hash object.

Initializes the values of `Hash#default` and `Hash#default_proc`, which determine the behaviour when a given key is not found.

By default, a hash has `nil` values for both `default` and `default_proc`:
```
h = Hash.new   # => {}
h.default      # => nil
h.default_proc # => nil
```

With argument `default_value` given, sets the `default` value for the hash:
```
h = Hash.new(false) # => {}
h.default           # => false
h.default_proc      # => nil
```

With a block given, sets the `default_proc` value:
```
h = Hash.new { |hash, key| "Hash #{hash}: Default value for #{key}" }
h.default            # => nil
h.default_proc       # => #<Proc:0x00000001074c0088 (irb):1>
h[:non_existent_key] # => "Hash {}: Default value for non_existent_key"
```
