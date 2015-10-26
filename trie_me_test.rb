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

  def test_it_handles_no_results
    trieme = TrieMe.new
    trieme.insert("cat")
    trieme.insert("dog")
    trieme.insert("dot")

    results = trieme.complete("do")
    assert_equal(["dog", "dot"], results)
  end

  def test_it_handles_words_more_than_one_letter_beyond_the_search
    trieme = TrieMe.new
    trieme.insert("cat")
    trieme.insert("pizza")
    trieme.insert("pizzeria")
    trieme.insert("piizzicato")

    results = trieme.complete("piz")
    assert_equal(["pizza", "pizzeria", "pizzicato"], results)
  end
end

# TODO: sanitize input for insertion
# TODO: sanitize input for search
