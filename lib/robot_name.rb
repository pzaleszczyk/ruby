class Robot
  ALL_NAMES = ("AA000".."ZZ999").to_a.shuffle

  def self.forget
    @@possible_names = ("AA000".."ZZ999").to_a.shuffle
  end

  def name
    @name ||= @@possible_names.shift
  end

  def reset
    @name = nil
  end
end