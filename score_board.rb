class ScoreBoard
	attr_accessor :details, :total_score, :wickets
	def initialize(player_count)
		@details = []
		@total_score = 0
		@wickets = player_count
	end

	def update_board(player, runs, out)
		player_name = "#{player.first_name} #{player.last_name}"
		player_names = @details.map do |detail|
			detail['full_name']
		end
		# @wickets -= 1 if out
		if player_names.include?(player_name)
			@details.each do |detail|
				if detail['full_name'] == player_name
					detail['runs'] = detail['runs'].to_i + runs
					detail['balls'] = detail['balls'].to_i + 1
					detail['out'] = out
				end
			end
		else
			player_score = {}
			player_score['full_name'] = player_name
			player_score['runs'] = runs
			player_score['balls'] = 1
			player_score['out'] = false
			@details << player_score
		end
		@total_score += runs
	end

	def display_score_board
		@details.each do |detail|
			puts "#{detail['full_name']} - #{detail['runs']}(#{detail['balls']} balls)"
		end
	end

end
