$row = 6;
$column = 7;
$board = [];
$winGame = false;
$tieGame = false;


class Connect4

	# def initialize
	# end
	

	def createBoard
		$row.times do |rowVar|
			$board[rowVar] = []

			$column.times do
				$board[rowVar] << 0
			end
		end
		puts " \n \t-------------------------------------- \n  \tWelcome to connection four - Lets Play \n \t-------------------------------------- \n "

	end

	def showBoard
		$row.times do |rowVar|
			$column.times do |colVar|
				print "#{$board[rowVar][colVar]}\t";
			end	
			puts
		end
		puts	
	end


	def validateRow(row,symbol)

		count=1;

		# puts row.class;

		$column.times do |col|
			if $board[row][col-1] == symbol
				count = count + 1;

				if count >= 3
					if symbol == '#'
						self.gameStatus('Win',1);
					else
						self.gameStatus('Win',2);
					end
					break
				end
			else
				count=1;
			end
		end

	end

	def validateColumn(column,symbol)
		count=1;
		$row.times do |row|
			if $board[row-1][column] == symbol
				count = count + 1;
				if count >= 3
					if symbol == '#'
						self.gameStatus('Win',1);
					else
						self.gameStatus('Win',2);
					end
					break;
				end
			else
				count=1;
			end
		end
	end

	def validateDiagonal(row,column,symbol)

	end

	def gameStatus(status,player)

		self.showBoard;

		if player > 0
			puts "Player #{player} #{status}";
		else
			puts "Game #{status}";
		end

		puts "Do you want to continue( 0 for yes and 1 for no ) :"
		reply = gets.to_i;
		# puts reply;

		if reply == 0 
			puts reply;
			self.createBoard;
			self.showBoard;
			Player.new;
		else
			exit;
		end
	end
end



class Player

	def initialize
		@player = true; #FOR FIRST PLAYER
		@count = 0;
		@connectObj = Connect4.new;
		self.playerInsertion; 
	end

	def playerInsertion

		until $winGame === true || $tieGame === true
			if @player === true
				
				puts "Player 1 : Enter the column number(1-7) :\t";
				columnVal = gets.to_i;

				if 0 < columnVal and columnVal <= 7 
					@count=@count+1;
					self.coinInsertion((columnVal-1),'#');
					self.selectPlayer;
				else 
					@count=@count-1;
					puts "Enter the correct column number";
					self.playerInsertion;
					
				end
			else
				puts "Player 2 : Enter the column number(1-7) :\t";
				columnVal = gets.to_i;
				puts;
				if 0 < columnVal and columnVal <= 7
					@count=@count+1;
					self.coinInsertion((columnVal-1),'@');
					self.selectPlayer;
					
				else
					@count=@count-1;
					puts "Enter the correct column number";
					self.playerInsertion;
				end		
			end
			@connectObj.showBoard;
			if @count == $row * $column
				$tieGame = true;
				connectObj.gameStatus('Tie',0);
			end
		end
	end

	def selectPlayer #toggling between players
			@player = !@player;
	end

	def coinInsertion(column, indicator)

		rowValue = $row - 1;
		until $board[rowValue][column] == 0 
			rowValue = rowValue-1;
		end
		if rowValue < 0
			self.selectPlayer;
			puts "Column is full! choose another column";
			self.playerInsertion;
		else
			$board[rowValue][column] = indicator;
			# return true;
		end
		puts "coins inserted #{@count}"
		if @count > 6
			self.validation(indicator, column, rowValue);
		end

	end

	def validation(symbol,column,row)
		@connectObj.validateRow(row,symbol);
		@connectObj.validateColumn(column,symbol);
		# @connectObj.validateDiagonal(row,column,symbol);
	end

end

connect =Connect4.new;
connect.createBoard;
connect.showBoard;
$playerObj = Player.new;
