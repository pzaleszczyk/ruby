
require_relative("../lib/book_store")

RSpec.describe BookStore do
  it("only a single book") do
    basket = [1]
    expect(BookStore.calculate_price(basket)).to(eq(8.0))
  end
  it("two of the same book") do
    basket = [2, 2]
    expect(BookStore.calculate_price(basket)).to(eq(16.0))
  end
  it("empty basket") do
    basket = []
    expect(BookStore.calculate_price(basket)).to(eq(0.0))
  end
  it("two different books") do
    basket = [1, 2]
    expect(BookStore.calculate_price(basket)).to(eq(15.2))
  end
  it("three different books") do
    basket = [1, 2, 3]
    expect(BookStore.calculate_price(basket)).to(eq(21.6))
  end
  it("four different books") do
    basket = [1, 2, 3, 4]
    expect(BookStore.calculate_price(basket)).to(eq(25.6))
  end
  it("five different books") do
    basket = [1, 2, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to(eq(30.0))
  end
  it("two groups of four is cheaper than group of five plus group of three") do
    basket = [1, 1, 2, 2, 3, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to(eq(51.2))
  end
  it("two groups of four is cheaper than groups of five and three") do
    basket = [1, 1, 2, 3, 4, 4, 5, 5]
    expect(BookStore.calculate_price(basket)).to(eq(51.2))
  end
  it("group of four plus group of two is cheaper than two groups of three") do
    basket = [1, 1, 2, 2, 3, 4]
    expect(BookStore.calculate_price(basket)).to(eq(40.8))
  end
  it("two each of first 4 books and 1 copy each of rest") do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5]
    expect(BookStore.calculate_price(basket)).to(eq(55.6))
  end
  it("two copies of each book") do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
    expect(BookStore.calculate_price(basket)).to(eq(60.0))
  end
  it("three copies of first book and 2 each of remaining") do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]
    expect(BookStore.calculate_price(basket)).to(eq(68.0))
  end
  it("three each of first 2 books and 2 each of remaining books") do
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]
    expect(BookStore.calculate_price(basket)).to(eq(75.2))
  end
  it("four groups of four are cheaper than two groups each of five and three") do
    basket = [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]
    expect(BookStore.calculate_price(basket)).to(eq(102.4))
  end
end
