class Acronym

  def self.abbreviate(text)
    text.scan(/\b[a-zA-Z]/).join.upcase
  end

end
