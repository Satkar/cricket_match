require './player.rb'
require './over.rb'
require './score_board.rb'

class Match
	attr_accessor :players, :overs, :score_board, :target_score
	def initialize()
		@players = []
		puts "Enter the number of player for a match"
		player_count = gets.to_i
		player_count.times do |player|
			puts "Enter the name of player #{player + 1}"
			puts "First Name"
			first_name = gets.strip
			puts "Last Name"
			last_name = gets.strip
			@players << Player.new(first_name, last_name)
		end
		puts "Enter the target score"
		@target_score = gets.to_i
		puts "Enter the number of overs for the match"
		@overs = gets.to_i
		@score_board = ScoreBoard.new(player_count)
	end

	def start
		strike = @players[0]
		non_strike = @players[1]
		last_batting_position = 1
		out = false
		@overs.times do |over|
		  6.times do |ball|
				run = rand(0..6)
				# if @score_board.total_score % 10 == 0 &&
				# 	run = 0
				# 	out = true
				# 	last_batting_position += 1
				# 	puts "Out state #{last_batting_position} #{@players}"
				# 	strike = @players[last_batting_position]
				# end
				b = ball + 1
				commentry(over, b, strike, run, out)
				out = false
				if [1, 3, 5].include?(run)
					strike, non_strike = rotate_strike(strike, non_strike)
				end
			end
			strike, non_strike = rotate_strike(strike, non_strike)
		end
	end

	def rotate_strike(strike, non_strike)
		temp = strike
		strike = non_strike
		non_strike = temp
		[strike, non_strike]
	end

	def score_board
		if @score_board.total_score == @target_score
			puts "Match Tied"
		elsif @score_board.total_score > @target_score
			puts "Team Won the match by wickets and balls"
		else
			puts "Team Bangalore lost the Match by #{@target_score - @score_board.total_score}"
		end
		@score_board.display_score_board
	end

	def commentry(over, ball, player, run, out)
		puts "#{over}.#{ball} #{player.first_name} #{player.last_name} scores #{run}"
		@score_board.update_board(player, run, out)
	end
end

final = Match.new
final.start
final.score_board

