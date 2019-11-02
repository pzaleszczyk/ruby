
require_relative("../lib/acronym")

RSpec.describe Acronym do
  it("basic") do
    expect(Acronym.abbreviate("Portable Network Graphics")).to(eq("PNG"))
  end
  it("lowercase words") do
    expect(Acronym.abbreviate("Ruby on Rails")).to(eq("ROR"))
  end
  it("punctuation") do
    expect(Acronym.abbreviate("First In, First Out")).to(eq("FIFO"))
  end
  it("all caps word") do
    expect(Acronym.abbreviate("GNU Image Manipulation Program")).to(eq("GIMP"))
  end
  it("punctuation without whitespace") do
    expect(Acronym.abbreviate("Complementary metal-oxide semiconductor")).to(eq("CMOS"))
  end
  it("very long abbreviation") do
    expect(Acronym.abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me")).to(eq("ROTFLSHTMDCOALM"))
  end
  it("consecutive delimiters") do
    expect(Acronym.abbreviate("Something - I made up from thin air")).to(eq("SIMUFTA"))
  end
end
