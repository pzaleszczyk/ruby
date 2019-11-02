class Pangram
  def self.pangram? s
    s.downcase.scan(/[a-z]/).uniq.sort == ('a'..'z').to_a
  end
end