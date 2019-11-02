
require_relative("../lib/ocr_numbers")

RSpec.describe OcrNumbers do

  it("recognizes 0") do
    input = [" _ ", "| |", "|_|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("0"))
  end
  it("recognizes 1") do
    input = ["   ", "  |", "  |", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("1"))
  end
  it("unreadable but correctly sized inputs return question mark") do
    input = ["   ", "  _", "  |", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("?"))
  end
  it("input with a number of lines that is not a multiple of four raises an error") do
    input = [" _ ", "| |", "   "].join("\n")
    expect { OcrNumbers.convert(input) }.to(raise_error(ArgumentError))
  end
  it("input with a number of columns that is not a multiple of three raises an error") do
    input = ["    ", "   |", "   |", "    "].join("\n")
    expect { OcrNumbers.convert(input) }.to(raise_error(ArgumentError))
  end
  it("recognizes 110101100") do
    input = ["       _     _        _  _ ", "  |  || |  || |  |  || || |", "  |  ||_|  ||_|  |  ||_||_|", "                           "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("110101100"))
  end
  it("garbled numbers in a string are replaced with question mark") do
    input = ["       _     _           _ ", "  |  || |  || |     || || |", "  |  | _|  ||_|  |  ||_||_|", "                           "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("11?10?1?0"))
  end
  it("recognizes 2") do
    input = [" _ ", " _|", "|_ ", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("2"))
  end
  it("recognizes 3") do
    input = [" _ ", " _|", " _|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("3"))
  end
  it("recognizes 4") do
    input = ["   ", "|_|", "  |", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("4"))
  end
  it("recognizes 5") do
    input = [" _ ", "|_ ", " _|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("5"))
  end
  it("recognizes 6") do
    input = [" _ ", "|_ ", "|_|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("6"))
  end
  it("recognizes 7") do
    input = [" _ ", "  |", "  |", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("7"))
  end
  it("recognizes 8") do
    input = [" _ ", "|_|", "|_|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("8"))
  end
  it("recognizes 9") do
    input = [" _ ", "|_|", " _|", "   "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("9"))
  end
  it("recognizes string of decimal numbers") do
    input = ["    _  _     _  _  _  _  _  _ ", "  | _| _||_||_ |_   ||_||_|| |", "  ||_  _|  | _||_|  ||_| _||_|", "                              "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("1234567890"))
  end
  it("numbers separated by empty lines are recognized lines are joined by commas") do
    input = ["    _  _ ", "  | _| _|", "  ||_  _|", "         ", "    _  _ ", "|_||_ |_ ", "  | _||_|", "         ", " _  _  _ ", "  ||_||_|", "  ||_| _|", "         "].join("\n")
    expect(OcrNumbers.convert(input)).to(eq("123,456,789"))
  end
end
