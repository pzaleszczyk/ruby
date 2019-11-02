class TwelveDays
  DAYS = ['first', 'second', 'third', 'fourth', 'fivth', 'sixth', 'seventh', 'eighth', 'nineth', 'tenth', 'eleventh', 'twelfth']
  VERSES = ['and a Partridge in a Pear Tree.', 'two Turtle Doves,', 'three French Hens,', 'four Calling Birds,', 'five Gold Rings,', 'six Geese-a-Laying,', 'seven Swans-a-Swimming,', 'eight Maids-a-Milking,', 'nine Ladies Dancing,', 'ten Lords-a-Leaping,', 'eleven Pipers Piping,', 'twelve Drummers Drumming,']

  def self.song
    array = []
    DAYS.each_with_index do | val, index|
      array << index
      verse_sum = array.map do |a|
        VERSES[a]
      end
      insert = verse_sum.reverse.join(' ')

      if index.zero?
        puts "On the #{DAYS[index]} day of Christmas my true love gave to me: a Partridge in a Pear Tree."
        puts ""
      else
        puts "On the #{DAYS[index]} day of Christmas my true love gave to me: #{insert} "
        puts ""
      end
    end
  end
end

TwelveDays.song