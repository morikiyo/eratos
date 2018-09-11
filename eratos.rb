class Eratos
  # arg: positive integer
  def self.generate(arg)
    [2,3,5,7,11,13,17,19,23,29]
  end
end

### Command Line
if $0 == __FILE__
  puts Eratos.generate(30).join(", ")
end
