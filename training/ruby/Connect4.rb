#Creating the board
class Connect4

	def welcome_message
		$Row = 6;
		$Column = 7;
		$Player1 = '#';
		$Player2 = '&';
		$board = Array.new($Row) { Array.new($Column ,'.')};
		$win_game = false;
		$tie_game = false;
		puts " \n \t\t-------------------------------------- \n  \t\tWelcome to connection four - Lets Play \n \t\t-------------------------------------- \n "
	end
	
	def show_board
		puts "\t1\t2\t3\t4\t5\t6\t7\n\n"
		$Row.times do |row|
			print "\t";
			$Column.times do |col|
				print "#{$board[row][col]}\t";
			end	
			puts
		end
		puts	
	end

	def game_status(status, symbol)
		self.show_board;
		if status == 'Win'
			$win_game = true;
			if symbol == $Player1
				puts "************************************************\n";
				puts "\n\t__________Player 1 Wins___________\n";
				puts "\n************************************************\n";
			else
				puts "************************************************\n";
				puts "\n\t__________Player 2 Wins___________\n";
				puts "\n************************************************\n";
			end
		else
			$tie_game = true;
			puts "************************************************\n";
			puts "\n\t__________Game Tie____________\n";
			puts "\n************************************************\n";
		end
		puts "Do you want to continue( 0 for yes and 1 for no ) :"
		reply = gets.to_i;
		if reply == 0 
			puts reply;
			self.welcome_message;
			self.show_board;
			Game.new;
		else
			exit;
		end
	end

	def validate_row_column(symbol, check_times, row_column_position, row_or_column)
		count = 0;
		check_times.times do |var|
			#Choosing the matrix position for row/column validation
			if row_or_column == true
				pos_x = row_column_position
				pos_y = var
			else
				pos_x = var
				pos_y = row_column_position
			end
			if $board[pos_x][pos_y] == symbol
				count += 1;
				if count == 4
					self.game_status('Win',symbol);
					break
				end
			else
				count = 0;
			end
		end
	end

	def validateDiagonal(row, column, symbol)
		self.negativeDiagonal(row, column, symbol);
		self.positiveDiagonal(row, column, symbol);
	end

	def negativeDiagonal(row, column, symbol)
		count = 0;
		diagonal_row = row;
		diagonal_column = column;
		#Validate the right side of the negative diagonal
		while diagonal_row >= 0 && diagonal_column < $Column
			if $board[diagonal_row][diagonal_column] == symbol
				count += 1;
				diagonal_row -= 1;
				diagonal_column += 1;
			else
				break;
			end
		end
		row += 1;
		column -= 1;
		#Validate the left side of the negative diagonal
		while row < $Row && column >= 0
			if $board[row][column] == symbol
				count += 1;
				row += 1;
				column -= 1;
			else
				break;
			end
		end
		if count == 4
			self.game_status('Win', symbol);
		end
	end

	def positiveDiagonal(row,column,symbol)
		count = 0;
		diagonal_row = row;
		diagonal_column = column;
		#Validate the right side of the positive diagonal
		while diagonal_row < $Row && diagonal_column < $Column
			if $board[diagonal_row][diagonal_column] == symbol
				count += 1;
				diagonal_row += 1;
				diagonal_column += 1;
			else
				break;
			end
		end
		row -= 1;
		column -= 1;
		#Validate the left side of the positive diagonal
		while row >= 0 && column >= 0
			if $board[row][column] == symbol
				count += 1;
				row -= 1;
				column -= 1;
			else
				break;
			end
		end
		if count == 4
			self.game_status('Win', symbol);
		end
	end

end

class Game

	def initialize
		@player = true; #FOR FIRST PLAYER
		@count = 0;
		@connect4_obj = Connect4.new;
		self.choose_player; 
	end

	def choose_player
		until $win_game === true || $tie_game === true
			if @player == true
				self.player_insertion(1, $Player1);
			else
				self.player_insertion(2, $Player2);	
			end
		end
	end

	def player_insertion(player, symbol)
		puts "Player #{player} : Enter the column number(1-7) :\t";
		column_number = gets.to_i;
		if 0 < column_number and column_number <= 7 
			row_number = column_availability_checker(column_number);
			if row_number >= 0
				@count += 1;
				self.coin_insertion(row_number, column_number-1, symbol);
				self.toggle_player;
			else
				puts "Column is full choose another column"
				self.choose_player;
			end
		else 
			puts "Enter the correct column number";
			self.choose_player;
		end
		@connect4_obj.show_board;
		if @count == $Row * $Column
			$tie_game = true;
			@connect4_obj.game_status('Tie',0);
		end
	end

	def toggle_player #toggling between players
			@player = !@player;
	end

	def column_availability_checker(column)
		row_val = $Row - 1;
		while $board[row_val][column-1] != '.' && row_val > -1
				row_val = row_val-1;
		end
		val = row_val < 0 ? -1 : row_val;
	end

	def coin_insertion(row_val,column,symbol)
		$board[row_val][column] = symbol;
		# puts "coins inserted #{@count}\n"
		if @count > 6
			self.validate(symbol, column, row_val);
		end
	end

	def validate(symbol,column,row)
		@connect4_obj.validate_row_column(symbol, $Column, row, true);
		@connect4_obj.validate_row_column(symbol, $Row, column, false);
		@connect4_obj.validateDiagonal(row, column, symbol);
	end

end

connect = Connect4.new;
connect.welcome_message;
connect.show_board;
Game.new;