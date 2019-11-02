
require_relative("../lib/matching_brackets")

RSpec.describe Brackets do
  it("paired square brackets") { expect(Brackets.paired?("[]")).to(eq(true)) }
  it("empty string") { expect(Brackets.paired?("")).to(eq(true)) }
  it("unpaired brackets") { expect(Brackets.paired?("[[")).to(eq(false)) }
  it("wrong ordered brackets") { expect(Brackets.paired?("}{")).to(eq(false)) }
  it("wrong closing bracket") { expect(Brackets.paired?("{]")).to(eq(false)) }
  it("paired with whitespace") { expect(Brackets.paired?("{ }")).to(eq(true)) }
  it("partially paired brackets") do
    expect(Brackets.paired?("{[])")).to(eq(false))
  end
  it("simple nested brackets") do
    expect(Brackets.paired?("{[]}")).to(eq(true))
  end
  it("several paired brackets") do
    expect(Brackets.paired?("{}[]")).to(eq(true))
  end
  it("paired and nested brackets") do
    expect(Brackets.paired?("([{}({}[])])")).to(eq(true))
  end
  it("unopened closing brackets") do
    expect(Brackets.paired?("{[)][]}")).to(eq(false))
  end
  it("unpaired and nested brackets") do
    expect(Brackets.paired?("([{])")).to(eq(false))
  end
  it("paired and wrong nested brackets") do
    expect(Brackets.paired?("[({]})")).to(eq(false))
  end
  it("paired and incomplete brackets") do
    expect(Brackets.paired?("{}[")).to(eq(false))
  end
  it("too many closing brackets") do
    expect(Brackets.paired?("[]]")).to(eq(false))
  end
  it("math expression") do
    expect(Brackets.paired?("(((185 + 223.85) * 15) - 543)/2")).to(eq(true))
  end
  it("complex latex expression") do
    string = ("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\ " + "\\mathrm{e}^{x} &... x^2 \\end{array}\\right)")
    expect(Brackets.paired?(string)).to(eq(true))
  end
end
