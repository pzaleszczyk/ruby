class Alphametics
  LETTERS = /[A-Z]/.freeze
  DIGITS = (0..9).to_a

  attr_reader :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def solve
    permutations.map { |values| Hash[unknowns.zip(values)] }
                .find do |map|
      solved?(map)
    end || {}
  end

  def solved?(map)
    candidate = puzzle.gsub LETTERS, map
    !candidate.match(/(\s|\A)0/) && eval(candidate)
  end

  def self.solve(puzzle)
    new(puzzle).solve
  end

  def permutations
    [
      NON_ZERO_DIGITS.permutation(unknowns.length),
      NON_ZERO_DIGITS.permutation(unknowns.length - 1).lazy
                     .flat_map { |perm| zero_possible.map { |idx| perm.insert(idx, 0) } }
    ].lazy.flat_map(&:lazy)
  end

  private

  def unknowns
    @unknowns ||= puzzle.scan(LETTERS).uniq
  end

  def zero_possible
    @zero_possible ||= (0..unknowns.length).to_a -
                       puzzle.scan(/(\s|\A)\w/)
                             .uniq
                             .map { |letter| unknowns.index(letter) }
  end
end