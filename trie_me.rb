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

    completions = search_for_completions(leaf_search_node)

    completions.each do |completion|
      word_recommendations.push(word + completion)
    end

    word_recommendations
  end

  def search_for_completions(node, previous_letters = "", completions = [])
    node.letters.each do |letter, node|
      partial_completion = previous_letters + letter

      if node.isComplete
        completions.push(partial_completion)
      end
      search_for_completions(node, partial_completion, completions)
    end

    completions
  end
end
