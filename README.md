A Ruby implementation of an autocomplete engine.

Based off [Turing School's]() [example assignment]().

Assuming you're on OSX:

```irb
  dict_words = File.read('/usr/share/dict/words')
  split_dict_words = dict_words.split("\n")
  t = TrieMe.new
  split_dict_words.each { |word| t.insert(word) }

  t.complete("simon")
  => ["simoniac", "simoniacal", "simoniacally", "simonious", "simonism", "simonist", "simony"]
```

Run the tests:

```ruby
ruby trie_me_test.rb
```

