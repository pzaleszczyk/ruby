
require_relative("../lib/bowling")

RSpec.describe Game do
  it("should be able to score a game with all zeros") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(0))
  end
  it("should be able to score a game with no strikes or spares") do
    game = Game.new
    rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(90))
  end
  it("a spare followed by zeros is worth ten points") do
    game = Game.new
    rolls = [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(10))
  end
  it("points scored in the roll after a spare are counted twice") do
    game = Game.new
    rolls = [6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(16))
  end
  it("consecutive spares each get a one roll bonus") do
    game = Game.new
    rolls = [5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(31))
  end
  it("a spare in the last frame gets a one roll bonus that is counted once") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(17))
  end
  it("a strike earns ten points in a frame with a single roll") do
    game = Game.new
    rolls = [10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(10))
  end
  it("points scored in the two rolls after a strike are counted twice as a bonus") do
    game = Game.new
    rolls = [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(26))
  end
  it("consecutive strikes each get the two roll bonus") do
    game = Game.new
    rolls = [10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(81))
  end
  it("a strike in the last frame gets a two roll bonus that is counted once") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(18))
  end
  it("rolling a spare with the two roll bonus does not get a bonus roll") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(20))
  end
  it("strikes with the two roll bonus do not get bonus rolls") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(30))
  end
  it("a strike with the one roll bonus after a spare in the last frame does not get a bonus") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(20))
  end
  it("all strikes is a perfect game") do
    game = Game.new
    rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(300))
  end
  it("rolls cannot score negative points") do
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(-1) }.to(raise_error(Game::BowlingError))
  end
  it("a roll cannot score more than 10 points") do
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(11) }.to(raise_error(Game::BowlingError))
  end
  it("two rolls in a frame cannot score more than 10 points") do
    game = Game.new
    rolls = [5]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(6) }.to(raise_error(Game::BowlingError))
  end
  it("bonus roll after a strike in the last frame cannot score more than 10 points") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(11) }.to(raise_error(Game::BowlingError))
  end
  it("two bonus rolls after a strike in the last frame cannot score more than 10 points") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(6) }.to(raise_error(Game::BowlingError))
  end
  it("two bonus rolls after a strike in the last frame can score more than 10 points if one is a strike") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6]
    rolls.each { |pins| game.roll(pins) }
    expect(game.score).to(eq(26))
  end
  it("the second bonus rolls after a strike in the last frame cannot be a strike if the first one is not a strike") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(10) }.to(raise_error(Game::BowlingError))
  end
  it("second bonus roll after a strike in the last frame cannot score more than 10 points") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(11) }.to(raise_error(Game::BowlingError))
  end
  it("an unstarted game cannot be scored") do
    game = Game.new
    rolls = []
    rolls.each { |pins| game.roll(pins) }
    expect { game.score }.to(raise_error(Game::BowlingError))
  end
  it("an incomplete game cannot be scored") do
    game = Game.new
    rolls = [0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect { game.score }.to(raise_error(Game::BowlingError))
  end
  it("cannot roll if game already has ten frames") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(0) }.to(raise_error(Game::BowlingError))
  end
  it("bonus rolls for a strike in the last frame must be rolled before score can be calculated") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
    rolls.each { |pins| game.roll(pins) }
    expect { game.score }.to(raise_error(Game::BowlingError))
  end
  it("both bonus rolls for a strike in the last frame must be rolled before score can be calculated") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
    rolls.each { |pins| game.roll(pins) }
    expect { game.score }.to(raise_error(Game::BowlingError))
  end
  it("bonus roll for a spare in the last frame must be rolled before score can be calculated") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3]
    rolls.each { |pins| game.roll(pins) }
    expect { game.score }.to(raise_error(Game::BowlingError))
  end
  it("cannot roll after bonus roll for spare") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(2) }.to(raise_error(Game::BowlingError))
  end
  it("cannot roll after bonus rolls for strike") do
    game = Game.new
    rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2]
    rolls.each { |pins| game.roll(pins) }
    expect { game.roll(2) }.to(raise_error(Game::BowlingError))
  end
end
