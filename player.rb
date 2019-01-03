class Player
	PROBABILITY = [
		"DOT" : 0.05,
		"1" : 0.3,
		"2" : 0.25,
		"3" : 0.1,
		"4" : 0.15,
		"5" : 0.01,
		"6" : 0.09,
		'OUT': 0.05
	]
	attr_accessor :first_name, :last_name, :dot_probalility
  def initialize(first_name, last_name)
  	@first_name =  first_name
  	@last_name = last_name
  	@dot_probalility = PROBABILITY
  end
end
