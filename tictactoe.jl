
board = ["1", "2", "3","4","5","6","7","8","9"]
win = 2  

function GameType()
   println("1. single player\n2. 2 person mode") 
    global gametype = readline()
end

function Choice()
    global n = readline()
    global nstring = n;
    n = parse(Int, n)
end

function BoardDraw(player, n, board)
if(player==0)
    player = 1
    board[n] = "X"

    else 
    player = 0
    board[n] = "O"
end 
    
for i=1:9
    if(i==1 || i==4 || i==7)
       print("\n") 
    end
    print(board[i])
    print(" ")
end
    
return player
end

function CheckWin(board)
    if((board[1]=="X" && board[2]=="X" && board[3]=="X")||(board[4]=="X" && board[5]=="X" && board[6]=="X")||(board[7]=="X" && board[8]=="X" && board[9]=="X")||(board[1]=="X" && board[5]=="X" && board[9]=="X")||(board[7]=="X" && board[5]=="X" && board[3]=="X")||(board[1]=="X" && board[4]=="X" && board[7]=="X")||(board[2]=="X" && board[5]=="X" && board[8]=="X")||(board[3]=="X" && board[6]=="X" && board[9]=="X"))
        println("Player X won")
        return 0
        
    elseif((board[1]=="O" && board[2]=="O" && board[3]=="O")||(board[4]=="O" && board[5]=="O" && board[6]=="O")||(board[7]=="O" && board[8]=="O" && board[9]=="O")||(board[1]=="O" && board[5]=="O" && board[9]=="O")||(board[7]=="O" && board[5]=="O" && board[3]=="O")||(board[1]=="O" && board[4]=="O" && board[7]=="O")||(board[2]=="O" && board[5]=="O" && board[8]=="O")||(board[3]=="O" && board[6]=="O" && board[9]=="O"))
        println("Player O won")
        return 1
    end
end
    
player = 0

GameType()

while(win!=0 && win!=1)
    if(player==0)
    print("Player X: ")

    else 
        print("Player O: ")
    end 
    if(gametype == "2" || (gametype == "1" && player == 0))
        Choice()
        
        while(board[n]!=nstring)
            println("Occupied")
            Choice()
        end   
        
        elseif(gametype == "1" && player == 1)
            global ai = rand(1:9)
            if(board[ai]=="O"||board[ai]=="X")
                println("Occupied")
            ai = rand(1:9)
            end
    end 
       
    if(gametype == "2" || (gametype=="1" && player == 0))
        player = BoardDraw(player, n, board)
        
        elseif(gametype=="1" && player ==1)
        player = BoardDraw(player, ai, board)
    end
    println("\n")
    win = CheckWin(board)
end



