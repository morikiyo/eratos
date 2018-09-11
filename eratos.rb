class Eratos
  # arg: positive integer
  def self.generate(arg)
    max_number = Integer(arg) rescue nil
    if max_number.nil? || max_number < 2
      raise ArgumentError, "specify an integer 2 and more to argument."
    end

    search_list = Range.new(2, max_number).to_a
    prime_numbers = []
    search_end_value = Math.sqrt(max_number)
    while search_list[0] <= search_end_value
      prime_numbers << search_list.delete_at(0)
      search_list.delete_if {|num| num % prime_numbers.last == 0 }
    end
    prime_numbers.concat(search_list)
  end
end

### Command Line
if $0 == __FILE__
  if ARGV.length != 1
    puts "usage: ruby #{File.basename($0)} number"
    exit
  end

  begin
    puts Eratos.generate(ARGV[0]).join(", ")
  rescue => ex
    puts ex.message
  end
end
