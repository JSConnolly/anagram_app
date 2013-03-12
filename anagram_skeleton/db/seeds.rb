File.open("web2.txt", "r") do |file|
  file.readlines.each do |line|
    line.strip!.downcase!
    canonical = line.split("").sort.join("")
    Term.create :name => line, :canonical => canonical, :length => line.length
  end
end
