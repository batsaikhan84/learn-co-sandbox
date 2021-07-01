class Test
  attr_accessor :name, :amount
  
  @@all = []
  
  def initialize(hash)
    @name = hash[:name]
    @amount = hash[:amount]
  end
  
  def self.finder(hash)
    hash.each do |e|
      self.all << self.new(e)
    end
  end
  
  def self.all
    @@all
  end
  
end

hash = [{name: "a", amount: 1000}, {name: "b", amount: 500}]


Test.finder(hash)

a = Test.all.find_all {|e| e.name == "a"}

puts a.inspect

Test.all.each {|e| puts e.inspect}







