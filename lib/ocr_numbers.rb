class OcrNumbers
  attr_reader :text

  def self.initialize(text)
    @text = text
  end

  def self.convert
    text.
      split("\n").
      each_slice(4).
      map { |line| numbers(line) }.
      join(",")
  end

  private

  def self.numbers(line)
    line.
      map { |row| row.chars.each_slice(3).to_a }.
      transpose.
      map { |str| digit(str.join) }.
      join
  end

  def self.digit(pattern)
    digits = {
      " _ | ||_|   " => 0,
      "     |  |   " => 1,
      " _  _||_    " => 2,
      " _  _| _|   " => 3,
      "   |_|  |   " => 4,
      " _ |_  _|   " => 5,
      " _ |_ |_|   " => 6,
      " _   |  |   " => 7,
      " _ |_||_|   " => 8,
      " _ |_| _|   " => 9
    }

    digits.default = "?"

    digits[pattern]
  end
end