#Creating the board
class Connect4

	def welcomeMessage
		$row = 6;
		$column = 7;
		$Player1 = '#';
		$Player2 = '&';
		$board = Array.new($row) { Array.new($column ,'.')};
		$winGame = false;
		$tieGame = false;
		puts " \n \t\t-------------------------------------- \n  \t\tWelcome to connection four - Lets Play \n \t\t-------------------------------------- \n "
	end
	
	def showBoard
		print "\t1\t2\t3\t4\t5\t6\t7\n"
		puts
		$row.times do |rowVar|
			print "\t";
			$column.times do |colVar|
				print "#{$board[rowVar][colVar]}\t";
			end	
			puts
		end
		puts	
	end

	def gameStatus(status,symbol)
		self.showBoard;
		if status == 'Win'
			$winGame=true;
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
			$tieGame=true;
			puts "************************************************\n";
			puts "\n\t__________Game Tie____________\n";
			puts "\n************************************************\n";
		end
		puts "Do you want to continue( 0 for yes and 1 for no ) :"
		reply = gets.to_i;
		if reply == 0 
			puts reply;
			self.welcomeMessage;
			self.showBoard;
			Game.new;
		else
			exit;
		end
	end

end

#For playing game
class Game

	def initialize
		@player = true; #FOR FIRST PLAYER
		@count = 0;
		@connectObj = Connect4.new;
		@validationObj = Validation.new;
		self.choosePlayer; 
	end

	def choosePlayer
		until $winGame === true || $tieGame === true
			if @player == true
				self.playerInsertion(1,$Player1);
			else
				self.playerInsertion(2,$Player2);	
			end
		end
	end

	def playerInsertion(player,symbol)
		puts "Player #{player} : Enter the column number(1-7) :\t";
		columnVal = gets.to_i;
		if 0 < columnVal and columnVal <= 7 
			check = columnAvailabiltyChecker(columnVal);
			if check != -1
				@count=@count+1;
				self.coinInsertion(check,columnVal-1,symbol);
				self.togglePlayer;
			else
				puts "Column is full choose another column"
				self.choosePlayer;
			end
		else 
			puts "Enter the correct column number";
			self.choosePlayer;
		end
		@connectObj.showBoard;
		if @count == $row * $column
			$tieGame = true;
			@connectObj.gameStatus('Tie',0);
		end
	end

	def togglePlayer #toggling between players
			@player = !@player;
	end

	def columnAvailabiltyChecker(column)
		rowValue = $row - 1;
		while $board[rowValue][column-1] != '.' && rowValue > -1
				rowValue = rowValue-1;
		end
		if rowValue < 0
			return -1;
		else
			return rowValue;
		end
	end

	def coinInsertion(rowValue,column,symbol)
		$board[rowValue][column] = symbol;
		# puts "coins inserted #{@count}\n"
		if @count > 6
			self.validate(symbol,column,rowValue);
		end
	end

	def validate(symbol,column,row)
		@validationObj.validateRow(row,symbol);
		@validationObj.validateColumn(column,symbol);
		@validationObj.validateDiagonal(row,column,symbol);
	end

end

# validation class
class Validation

	def initialize
		@connectObj = Connect4.new;
	end

	def validateRow(row, symbol)
		count=0;
		$column.times do |col|
			if $board[row][col] == symbol
				count += 1;
				if count == 4
					@connectObj.gameStatus('Win',symbol);
					break
				end
			else
				count=0;
			end
		end
	end

	def validateColumn(column,symbol)
		count=0;
		$row.times do |row|
			if $board[row][column] == symbol
				count += 1;
				if count == 4
					@connectObj.gameStatus('Win',symbol);
					break;
				end
			else
				count=0;
			end
		end
	end

	def validateDiagonal(row,column,symbol)
		self.negativeDiagonal(row,column,symbol);
		self.positiveDiagonal(row,column,symbol);
	end

	def negativeDiagonal(row,column,symbol)
		count=0;
		diagonalRow = row;
		diagonalColumn = column;
		while diagonalRow>=0 && diagonalColumn<$column
			if $board[diagonalRow][diagonalColumn] === symbol
				count+=1;
				diagonalRow-=1;
				diagonalColumn+=1;
			else
				break
			end
		end
		row+=1;
		column-=1;
		while row<$row && column>=0
			if $board[row][column] === symbol
				count+=1;
				row+=1;
				column-=1;
			else
				break;
			end
		end
		if count==4
			@connectObj.gameStatus('Win',symbol);
		end
	end

	def positiveDiagonal(row,column,symbol)
		count = 0;
		diagonalRow = row;
		diagonalColumn = column;
		while diagonalRow<$row && diagonalColumn<$column
			if $board[diagonalRow][diagonalColumn] === symbol
				count+=1;
				diagonalRow+=1
				diagonalColumn+=1
			else
				break
			end
		end
		row-=1
		column-=1
		while row>=0 && column>=0
			if $board[row][column] == symbol
				count+=1
				row-=1
				column-=1
			else
				break
			end
		end
		if count==4
			@connectObj.gameStatus('Win',symbol);
		end
	end

end

connect = Connect4.new;
connect.welcomeMessage;
connect.showBoard;
Game.new;