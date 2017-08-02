require 'json'

def wari(a, b)
  numArray = a.divmod(b)
  if numArray[1] == 0
    return numArray[0]
  else
    return "#{numArray[0]}...#{numArray[1]}"
  end
end

def kake(a, b)
  return a*b
end

def calculator(problems)
  JSON.load(problems).each do |set|
    if set["type"] == "wari"
      puts "(#{set["num"]}) #{set["a"]} / #{set["b"]} = #{wari(set["a"].to_i, set["b"].to_i)}"
    elsif set["type"] == "kake"
      puts "(#{set["num"]}) #{set["a"]} * #{set["b"]} = #{kake(set["a"].to_i, set["b"].to_i)}"
    else
      puts "(#{set["num"]}) error..."
    end
  end
end


ARGV.each do |elm|
  filepath = "./problems/#{elm}.json"
  problems = File.open(filepath, "r")
  #puts filepath
  puts "---------#{elm}---------"
  calculator(problems)
end

#puts "d113"
#calculator(d113)
