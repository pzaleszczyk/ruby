
require_relative("../lib/high_scores")

RSpec.describe HighScores do
  it("list of scores") do
    scores = [30, 50, 20, 70]
    expected = [30, 50, 20, 70]
    expect(HighScores.new(scores).scores).to(eq(expected))
  end
  it("latest score") do
    scores = [100, 0, 90, 30]
    expected = 30
    expect(HighScores.new(scores).latest).to(eq(expected))
  end
  it("personal best") do
    scores = [40, 100, 70]
    expected = 100
    expect(HighScores.new(scores).personal_best).to(eq(expected))
  end
  it("personal top three from a list of scores") do
    scores = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
    expected = [100, 90, 70]
    expect(HighScores.new(scores).personal_top_three).to(eq(expected))
  end
  it("personal top highest to lowest") do
    scores = [20, 10, 30]
    expected = [30, 20, 10]
    expect(HighScores.new(scores).personal_top_three).to(eq(expected))
  end
  it("personal top when there is a tie") do
    scores = [40, 20, 40, 30]
    expected = [40, 40, 30]
    expect(HighScores.new(scores).personal_top_three).to(eq(expected))
  end
  it("personal top when there are less than 3") do
    scores = [30, 70]
    expected = [70, 30]
    expect(HighScores.new(scores).personal_top_three).to(eq(expected))
  end
  it("personal top when there is only one") do
    scores = [40]
    expected = [40]
    expect(HighScores.new(scores).personal_top_three).to(eq(expected))
  end
  it("latest score is not the personal best") do
    scores = [100, 40, 10, 70]
    expect(HighScores.new(scores).latest_is_personal_best?).to(eq(false))
  end
  it("latest score is the personal best") do
    scores = [70, 40, 10, 100]
    expect(HighScores.new(scores).latest_is_personal_best?).to(eq(true))
  end
end
