def create_array
	puts "Enter the number of rows"
	rows = gets.to_i

	puts "Enter the number of columns"
	columns = gets.to_i

	matrix = []
	rows.times do |row|
		arr = []
		columns.times do |column|
				arr << gets.to_i
		end
		matrix << arr
	end
	puts spiral(matrix)
end

def spiral(matrix)
  matrix.empty? ? [] : matrix.shift + spiral(matrix.transpose.reverse)
end

# def spiral_traverse(arrs)

# 	 rows = arrs.length - 1
#    columns = arrs[0].length - 1

#    j = 0
#    k = 0
#    result_array = []
#    i  = 0
#    numbers = []
#    puts rows
#    puts columns
#    puts "Array list******************************************************************"
#    puts arrs[0][1]
#    while j < columns
# 		  result_array << arrs[0][j]
# 		  j = j + 1
# 	 end

# # while i < 6
# #   puts "At the top i is #{i}"
# #   numbers.push(i)

# #   i += 1
# #   puts "Numbers now: ", numbers
# #   puts "At the bottom i is #{i}"
# # end

# puts result_array
# end

def spiral_traverse(arrs)

	matrix = Marshal.load(Marshal.dump(arrs))
  output = []

  # # Lambdas to execute depending on the current case. In summary, they will do the following:
  # # top    -> remove the first array, which is the first row.
  # # right  -> for each row, remove the last element (last column) and return all of them packed (map).
  # # bottom -> remove the last array, which is the last row. The result must be reversed.
  # # left   -> for each row, remove the first element (first column) and return all of them packed (map). The result must be reversed.
  # actions = {
  #   top:    lambda{ matrix.shift                       },
  #   right:  lambda{ matrix.map { |f| f.pop }           },
  #   bottom: lambda{ matrix.pop.reverse                 },
  #   left:   lambda{ matrix.map { |f| f.shift }.reverse }
  # }
  # # `cases` will iterate the above hash keys like following: top, right, bottom, left, top, right, ...
  # cases = actions.keys.cycle

  # # Repeat until the matrix is empty (this will call the lambdas from the hash of above).
  # output.concat actions[ cases.next ].call() until matrix.empty?

  # # Return output array.
  # output
  # #  rows = arrs.length - 1
  # #  columns = arrs[0].length - 1

  #  j = 0
  #  k = 0
  #  result_array = []

  #  while j <= columns
		#   result_array << arrs[0][j]
  #  		j = j + 1
	 # end

	 # puts "*****************************TOP*************************************"
	 # puts result_array

  #  	# Get the right column
  #  	while (k <= rows)
  #  		result_array << arrs[columns][k]
  #  		k = k + 1
  #  	end
  #  	puts "*****************************Right col*************************************"
	 # puts result_array

  #  	# Get the bottam row in reverse order
  #  	j = j - 1
  #  	while (j >= 0)
  #  		result_array << arrs[columns][j]
  #  		j = j - 1
  #  	end

  #  puts "*****************************bottam*************************************"
	 # puts result_array
  #  	k = k - 1

  #  	while (k > 0)
  #  		result_array << arrs[k][0]
  #  		k = k - 1
  #  	end

  puts "Shift *************************************************************************************"
   puts matrix.shift

  puts "transpose ****************************************************************************************"
   puts matrix.transpose
puts "transpose reverse****************************************************************************************"
   puts matrix.transpose.reverse

 matrix.empty? ? [] : matrix.shift + spiral_traverse(matrix.transpose.reverse)


end

create_array


# 4		5		6		7
# 1		3		9		10
# 2		8		11	12
# 45	55	66	22
