class Alphametics
  def self.solve(puzzle)
    new(puzzle).solve
  end

  private

  def initialize(puzzle)
    @puzzle = puzzle
    @magnitudes = []
	@coefficients = nil
  end

  attr_reader :puzzle

  def unknowns
    @unknowns ||= puzzle.scan(/[[:alpha:]]/).sort.uniq
  end

  def unknown_count
    @unknown_count ||= unknowns.length
  end

  def stringified_nonzero_unknowns
    nonzero_unknowns = puzzle.scan(/\b[[:alpha:]]/).uniq
    conditions = nonzero_unknowns.map do |unknown|
      "#{unknown}.nonzero?"
    end

    conditions.join(' && ').downcase
  end

  def coefficients
    if @coefficients.nil?
      words = puzzle.scan(/[[:alpha:]]+/)
      word_coefficients = words.reverse.map { |word| decompose(word) }
      @coefficients = combine(word_coefficients)
    end
    @coefficients
  end

  def magnitudes(position)
    @magnitudes[position] ||= 10**position
  end

  def decompose(word)
    word_coefficients = Array.new(unknown_count, 0)

    word.chars.reverse.each_with_index do |unknown, position|
      word_coefficients[unknowns.index(unknown)] += magnitudes(position)
    end

    word_coefficients
  end

  def combine(elements)
    elements.transpose.map { |coefficients| coefficients.reduce(&:-) }
  end

  def stringified_equation
    elements = unknown_count.times.map { |i| "#{unknowns[i]} * #{coefficients[i]}" }
    function = elements.join(' + ').downcase
    "(#{function}).zero?"
  end

  def stringified_unknowns
    unknowns.join(',').downcase
  end

  public

  def solve
    checker = eval("lambda { |#{stringified_unknowns}| #{stringified_nonzero_unknowns} && #{stringified_equation} }")

    candidates = (0..9).to_a.permutation(unknown_count)
    solution = candidates.find { |candidate| checker.call(*candidate) }

    return {} if solution.nil?

    unknowns.zip(solution).to_h
  end
end