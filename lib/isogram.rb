class Isogram
  def self.isogram?(input)
    input.downcase.scan(/\w+/).join
      .chars.group_by {|x| x}
      .map {|x,y|y.count>1}
      .include?(true) ? false : true
  end
end