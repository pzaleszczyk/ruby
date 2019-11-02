
require_relative("../lib/sum_of_multiples")

RSpec.describe SumOfMultiples do
  it("no multiples within limit") do
    sum_of_multiples = SumOfMultiples.new(3, 5)
    expect(sum_of_multiples.to(1)).to(eq(0))
  end
  it("one factor has multiples within limit") do
    sum_of_multiples = SumOfMultiples.new(3, 5)
    expect(sum_of_multiples.to(4)).to(eq(3))
  end
  it("more than one multiple within limit") do
    sum_of_multiples = SumOfMultiples.new(3)
    expect(sum_of_multiples.to(7)).to(eq(9))
  end
  it("more than one factor with multiples within limit") do
    sum_of_multiples = SumOfMultiples.new(3, 5)
    expect(sum_of_multiples.to(10)).to(eq(23))
  end
  it("each multiple is only counted once") do
    sum_of_multiples = SumOfMultiples.new(3, 5)
    expect(sum_of_multiples.to(100)).to(eq(2318))
  end
  it("a much larger limit") do
    sum_of_multiples = SumOfMultiples.new(3, 5)
    expect(sum_of_multiples.to(1000)).to(eq(233168))
  end
  it("three factors") do
    sum_of_multiples = SumOfMultiples.new(7, 13, 17)
    expect(sum_of_multiples.to(20)).to(eq(51))
  end
  it("factors not relatively prime") do
    sum_of_multiples = SumOfMultiples.new(4, 6)
    expect(sum_of_multiples.to(15)).to(eq(30))
  end
  it("some pairs of factors relatively prime and some not") do
    sum_of_multiples = SumOfMultiples.new(5, 6, 8)
    expect(sum_of_multiples.to(150)).to(eq(4419))
  end
  it("one factor is a multiple of another") do
    sum_of_multiples = SumOfMultiples.new(5, 25)
    expect(sum_of_multiples.to(51)).to(eq(275))
  end
  it("much larger factors") do
    sum_of_multiples = SumOfMultiples.new(43, 47)
    expect(sum_of_multiples.to(10000)).to(eq(2203160))
  end
  it("all numbers are multiples of 1") do
    sum_of_multiples = SumOfMultiples.new(1)
    expect(sum_of_multiples.to(100)).to(eq(4950))
  end
  it("no factors means an empty sum") do
    sum_of_multiples = SumOfMultiples.new
    expect(sum_of_multiples.to(10000)).to(eq(0))
  end
  it("the only multiple of 0 is 0") do
    sum_of_multiples = SumOfMultiples.new(0)
    expect(sum_of_multiples.to(1)).to(eq(0))
  end
  it("solutions using include exclude must extend to cardinality greater than 3") do
    sum_of_multiples = SumOfMultiples.new(2, 3, 5, 7, 11)
    expect(sum_of_multiples.to(10000)).to(eq(39614537))
  end
end
