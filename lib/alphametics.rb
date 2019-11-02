class Alphametics
  def self.solve(string)
    @string = string.gsub('^', '**')

    possible_maps.find { |map| puzzle_solved?(map) }
  end

  private

  def self.possible_maps
    uniq_chars = @string.scan(/[[:alpha:]]/).uniq
    permutations = (0..9).to_a.permutation(uniq_chars.length)

    permutations.map do |permutation|
      uniq_chars.zip(permutation).to_h
    end
  end

  def self.puzzle_solved?(map)
    string = @string.gsub(/[[:alpha:]]/, map)
    return false if string =~ /\b0\d+/
    eval(string)
  end
end
