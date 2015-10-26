require 'minitest'
require 'minitest/autorun'

require_relative './trie_me'

class TrieMeTest < Minitest::Test
  def test_it_retrieves_found_word
    trieme = TrieMe.new
    trieme.insert("cat")
    trieme.insert("dog")

    results = trieme.complete("ca")
    assert_equal(["cat"], results)

    results = trieme.complete("do")
    assert_equal(["dog"], results)
  end

  def test_it_handles_no_results
    trieme = TrieMe.new
    trieme.insert("cat")
    trieme.insert("dog")

    results = trieme.complete("puppy")
    assert_equal([], results)
  end

  # TODO: it returns multiple results
  def test_it_handles_no_results
    trieme = TrieMe.new
    trieme.insert("cat")
    trieme.insert("dog")
    trieme.insert("dot")

    results = trieme.complete("do")
    assert_equal(["dog", "dot"], results)
  end
end
