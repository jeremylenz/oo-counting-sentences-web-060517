require 'pry'

class String

  def sentence?
    self.end_with?(".")
  end

  def question?
    self.end_with?("?")
  end

  def exclamation?
    self.end_with?("!")
  end

  def count_sentences
    split_self = self.split(".")
    split_self.delete_if { |chunk| chunk == "" }
    # binding.pry
    # Now we have an array split by periods with extra ones removed
    # binding.pry
    ["?","!"].each do |punctuation_mark|
      split_self.map! do |piece|
        piece.split(punctuation_mark)
      end
      # Flatten as many times as we need to

      while split_self[0].class == Array
        split_self.flatten!
      end
      # Delete the blank strings from the array
      split_self.delete_if { |chunk| chunk == "" }
      # binding.pry
    end
# The length of the array should be the number of sentences 
  split_self.length
  end

end
