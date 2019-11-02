# Sing the Twelve Days of Christmas
class TwelveDays
  VERSION = 1
  PREFIX = "On the %{nth} day of Christmas my true love gave to me, %{items}\n"
  LYRICS = {
    first: 'a Partridge in a Pear Tree.',
    second: 'two Turtle Doves',
    third: 'three French Hens',
    fourth: 'four Calling Birds',
    fifth: 'five Gold Rings',
    sixth: 'six Geese-a-Laying',
    seventh: 'seven Swans-a-Swimming',
    eighth: 'eight Maids-a-Milking',
    ninth: 'nine Ladies Dancing',
    tenth: 'ten Lords-a-Leaping',
    eleventh: 'eleven Pipers Piping',
    twelfth: 'twelve Drummers Drumming'
  }
  DAYS = LYRICS.keys

  def self.song
    (0...DAYS.size).map { |i| verse(i) }.join("\n")
  end

  def self.verse(n)
    items = n.downto(0).map { |i| LYRICS[DAYS[i]] }
    items[-1] = items[-1].sub(/^/, 'and ') if n > 0
    items_phrase = items.join(', ')
    PREFIX % { nth: DAYS[n], items: items_phrase }
  end
end