
require_relative("../lib/pangram")

RSpec.describe Pangram do
  it("sentence empty") do
    sentence = ""
    result = Pangram.pangram?(sentence)
    expect(result).to(be_falsey)
  end
  it("recognizes a perfect lower case pangram") do
    sentence = "abcdefghijklmnopqrstuvwxyz"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_truthy)
  end
  it("pangram with only lower case") do
    sentence = "the quick brown fox jumps over the lazy dog"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_truthy)
  end
  it("missing character x") do
    sentence = "a quick movement of the enemy will jeopardize five gunboats"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_falsey)
  end
  it("missing character h") do
    sentence = "five boxing wizards jump quickly at it"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_falsey)
  end
  it("pangram with underscores") do
    sentence = "the_quick_brown_fox_jumps_over_the_lazy_dog"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_truthy)
  end
  it("pangram with numbers") do
    sentence = "the 1 quick brown fox jumps over the 2 lazy dogs"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_truthy)
  end
  it("missing letters replaced by numbers") do
    sentence = "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_falsey)
  end
  it("pangram with mixed case and punctuation") do
    sentence = "\"Five quacking Zephyrs jolt my wax bed.\""
    result = Pangram.pangram?(sentence)
    expect(result).to(be_truthy)
  end
  it("upper and lower case versions of the same character should not be counted separately") do
    sentence = "the quick brown fox jumps over with lazy FX"
    result = Pangram.pangram?(sentence)
    expect(result).to(be_falsey)
  end
end
