
require_relative("../lib/isogram")

RSpec.describe Isogram do
  it("empty string") do
    input = ""
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("isogram with only lower case characters") do
    input = "isogram"
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("word with one duplicated character") do
    input = "eleven"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("word with one duplicated character from the end of the alphabet") do
    input = "zzyzx"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("longest reported english isogram") do
    input = "subdermatoglyphic"
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("word with duplicated character in mixed case") do
    input = "Alphabet"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("word with duplicated character in mixed case lowercase first") do
    input = "alphAbet"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("hypothetical isogrammic word with hyphen") do
    input = "thumbscrew-japingly"
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("hypothetical word with duplicated character following hyphen") do
    input = "thumbscrew-jappingly"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("isogram with duplicated hyphen") do
    input = "six-year-old"
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("made up name that is an isogram") do
    input = "Emily Jung Schwartzkopf"
    expect(Isogram.isogram?(input)).to(eq(true))
  end
  it("duplicated character in the middle") do
    input = "accentor"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
  it("same first and last characters") do
    input = "angola"
    expect(Isogram.isogram?(input)).to(eq(false))
  end
end
