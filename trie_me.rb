class TrieMe
  def initialize
    @tree = Node.new
  end

  def insert(word)
    # TODO: clean word input
    current_node = @tree

    word.split("").each_with_index do |letter, character_position|
      current_node.add_letter(letter)
      current_node = current_node.letters[letter]

      if word.length == (character_position + 1)
        current_node.isComplete = true
      end
    end
  end

  def complete(word)
    @tree.branch_for(word)
  end
end

class Node
  attr_accessor :isComplete
  attr_accessor :letters

  def initialize
    @isComplete = false
    @letters = Hash.new
  end

  def add_letter(letter)
    @letters[letter] ||= Node.new
  end

  def branch_for(word)
    current_letters = @letters
    leaf_search_node = nil

    word.split("").each do |letter|
      current_node = current_letters[letter]

      if current_node.nil?
        leaf_search_node = nil
        break
      end

      current_letters = current_node.letters
      leaf_search_node = current_node
    end

    find_words_from_leaf_search(leaf_search_node, word)
  end

  private

  def find_words_from_leaf_search(leaf_search_node, word)
    word_recommendations = []

    if leaf_search_node.nil?
      return word_recommendations
    end

    leaf_search_node.letters.each do |letter, node|
      if node.isComplete
        word_recommendations.push(word + letter)
      end
    end

    # if node is not complete and there are letters keep going
    word_recommendations
  end
end
