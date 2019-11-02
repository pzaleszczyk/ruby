
require_relative("../lib/twelve_days")

RSpec.describe TwelveDays do
  it("the whole song") do
    song_file = File.expand_path("../song.txt", "twelve_days_test.rb")
    expected = IO.read(song_file)
    expect(TwelveDays.song).to(eq(expected))
  end
end
