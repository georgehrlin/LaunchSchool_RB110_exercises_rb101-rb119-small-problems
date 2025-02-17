## FURTHER EXPLORATION

One thing to note here is the `String#prepend` method; unlike most string mutating methods, the name of this method does not end with a `!`. However, it is still a mutating method - it changes the string in place.

This is actually pretty common with mutating methods that do not have a corresponding non-mutating form. `chomp!` ends with a `!` because the non-mutating `chomp` is also defined. prepend does not end with a `!` because there is no non-mutating form of prepend.

How many mutating String methods can you find that do not end with a `!`. Can you find any that end with a `!`, but don't have a non-mutating form? Does the Array class have any methods that fit this pattern? How about the Hash class?

# A:
### Mutating String methods without ending wiht a `!`
- `<<`: Concatenates `object` to `self` and returns `self`
- `clear`: Removes the contents of `self`
- `concat`: Concatenates each object in `objects` to `self` and returns `self`
- `insert`: Inserts the given `other_string` into `self`; returns `self`
- `prepend`: Prepends each string in `other_strings` to `self` and returns `self`
- `replace`: Replaces the contents of `self` with the contents of `other_string`

### Mutating String methods ending with a `!` and without a corresponding non-mutating form
I couldn't find any such String methods.

### Mutating Array methods without ending with a `!`
- `<<`: Appends `object` to `self`; returns `self`
- `append`: Appends trailing elements. Appends each argument in `objects` to `self`; returns `self`
- `clear`: Removes all elements from `self`
- `concat`: Adds to `array` all elements from each Array in `other_arrays`; returns `self`
- `delete`: Removes zero or more elements from `self`
- `delete_at`: Deletes an element from `self`, per the given Integer `index`
- `delete_if`: Removes each element in `self` for which the block returns a truthy value; retusn `self`
- `fill`: Replaces specified elements in `self` with specified objects; returns `self`
- `initialize_copy`: Replaces the content of `self` with the content of `other_array`; returns `self`
- `insert`: Inserts given `objects` before or after the element at Integer index `offset`; returns `self`
- `keep_if`: Retains those elements for which the block returns a truthy value; deletes all other elements; returns `self`
- `pop`: Removes and returns trailing elements
- `prepend`: (Alias for `unshift`)
- `push`: Appends trailing elements. Appends each argument in `objects` to `self`; returns `self`
- `replace`: (Alias for: `initialize_copy`)
- `shift`: Removes and returns leading elements

### Mutating Hash methods without ending with a `!`
- `clear`: Removes all hash entries; returns `self`
- `delete`: Deletes the entry for the given `key` and returns its associated value
- `delete_if`: If a block is given, calls the block with each key-value pair; deletes each entry for which the block returns a truthy value; returns `self`
- `initialize_copy`: Replaces the entire contents of `self` with the contents of `other_hash`; returns `self`
- `keep_if`: Calls the block for each key-value pair; retains the entry if the block returns a truthy value; otherwise deletes the entry; returns `self`
- `rehash`: Rebuilds the hash by recomputing the hash index for each key; returns `self`
- `replace`: Replaces the entire contents of `self` with the contents of `other_hash`; returns `self`
- `shift`: Removes the first hash entry; returns a 2-element Array containing the removed key and value
- `store`: Associates the given `value` with the given `key`; returns `value`. (Alias for `[]=`)
- `update`: Merges each of `other_hashes` into `self`; returns `self`. (Alias for `merge!`)
