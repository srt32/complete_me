require 'minitest'
require 'minitest/autorun'

require_relative './trie_me'

class TrieMeTest < Minitest::Test
  def test_it_works
    trieme = TrieMe.new
    # trieme.insert("cat")
    trieme.insert("dog")

    # results = trieme.complete("ca")
    # assert_equal(["cat"], results)

    results = trieme.complete("do")
    assert_equal(["dog"], results)
  end
end

# TODO: handle no results, where get to leaf node without isComplete (empty letters)
