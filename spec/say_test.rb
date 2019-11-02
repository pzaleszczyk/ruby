
require_relative("../lib/say")

RSpec.describe Say do
  it("zero") do
    number = 0
    expect(Say.new(number).in_english).to(eq("zero"))
  end
  it("one") do
    number = 1
    expect(Say.new(number).in_english).to(eq("one"))
  end
  it("fourteen") do
    number = 14
    expect(Say.new(number).in_english).to(eq("fourteen"))
  end
  it("twenty") do
    number = 20
    expect(Say.new(number).in_english).to(eq("twenty"))
  end
  it("twenty two") do
    number = 22
    expect(Say.new(number).in_english).to(eq("twenty-two"))
  end
  it("one hundred") do
    number = 100
    expect(Say.new(number).in_english).to(eq("one hundred"))
  end
  it("one hundred twenty three") do
    number = 123
    expect(Say.new(number).in_english).to(eq("one hundred twenty-three"))
  end
  it("one thousand") do
    number = 1000
    expect(Say.new(number).in_english).to(eq("one thousand"))
  end
  it("one thousand two hundred thirty four") do
    number = 1234
    expect(Say.new(number).in_english).to(eq("one thousand two hundred thirty-four"))
  end
  it("one million") do
    number = 1000000
    expect(Say.new(number).in_english).to(eq("one million"))
  end
  it("one million two thousand three hundred forty five") do
    number = 1002345
    expect(Say.new(number).in_english).to(eq("one million two thousand three hundred forty-five"))
  end
  it("one billion") do
    number = 1000000000
    expect(Say.new(number).in_english).to(eq("one billion"))
  end
  it("a big number") do
    number = 987654321123
    expect(Say.new(number).in_english).to(eq("nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"))
  end
  it("numbers below zero are out of range") do
    number = -1
    expect { Say.new(number).in_english }.to(raise_error(ArgumentError))
  end
  it("numbers above 999 999 999 999 are out of range") do
    number = 1000000000000
    expect { Say.new(number).in_english }.to(raise_error(ArgumentError))
  end
end
