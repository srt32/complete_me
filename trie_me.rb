class TrieMe
  def initialize
    @tree = Node.new
  end

  def insert(word)
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
    leaf_search_node = find_leaf_search_node(word, @letters)
    find_words_from_leaf_search(leaf_search_node, word)
  end

  private

  def find_leaf_search_node(word, current_letters)
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

    leaf_search_node
  end

  def find_words_from_leaf_search(leaf_search_node, word)
    if leaf_search_node.nil?
      return []
    end

    completions = search_for_completions(leaf_search_node)

    completions.map do |completion|
      word + completion
    end
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
