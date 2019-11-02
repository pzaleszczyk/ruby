class TwelveDays
  DAYS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  GIFTS = ["and a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]

  def self.song
    (0...12).map(&method(:verse)).join("\n\n") + "\n"
  end

  def self.gifts(day)
    return GIFTS[0][4..-1] if day == 1
    (0...day).map(&method(:gift)).reverse.join(", ")
  end

  def self.gift(num)
    GIFTS[num]
  end

  def self.verse(day)
    "On the #{DAYS[day]} day of Christmas my true love gave to me: #{gifts(day + 1)}."
  end
end