class BookStore
  SINGLE_PRICE = 8
  DISCOUNT_MAP = {1 => 0.0, 2 => 0.05, 3 => 0.1, 4 => 0.2, 5 => 0.25}

  def self.calculate_price(book_numbers)
    new(book_numbers).calculate_price
  end

  def initialize(book_numbers)
    @book_numbers = book_numbers
  end

  def calculate_price
    return 0 if book_numbers.size == 0
    combinations.map { |combination| total_price(combination) }.min
  end

  private

  attr_reader :book_numbers

  def combinations
    [tall_combinations, wide_combinations]
  end

  def tall_combinations
    book_number_groups.map { |group| Array.new(number_of_sets) { |i| group[i] } }.transpose.map(&:compact)
  end

  def wide_combinations
    sets = Array.new(number_of_sets) { [] }
    indicies = (0...sets.size).cycle
    current_index = indicies.first
    book_numbers.each do |number|
      current_index = indicies.next while sets[current_index].include?(number)
      sets[current_index] << number
      current_index = indicies.next
    end
    sets
  end

  def number_of_sets
    book_number_groups.map(&:size).max
  end

  def book_number_groups
    @book_number_groups ||= book_numbers.group_by(&:itself).values
  end

  def total_price(combination)
    combination.map { |set| price(set) }.sum
  end

  def price(set)
    set.size * SINGLE_PRICE * (1 - DISCOUNT_MAP[set.size])
  end
end

class BookKeeping
  VERSION = 0
end