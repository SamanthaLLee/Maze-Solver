package maze;
import java.util.Random;

public class Maze
{
    //instance fields and variables
    private char exit = 'E';
    private char hedge = 'H';
    private char path = 'P';
    private char[][] myMaze;
    private boolean[][] visited;
    private Random rand = new Random();
    
    //default maze constructor
    public Maze()
    {
        myMaze = new char[0][0];
        visited = new boolean[0][0]; 
        fill();
    }
    
    //maze constructor: constructs maze with given dimension 
    public Maze(int numRows, int numCols)
    {  
        myMaze = new char[numRows][numCols];
        visited = new boolean[numRows][numCols]; 
        fill();
    }
      
    //generates a basic maze
    public void fill()
    {     
        //variable used later
        int random = 0;
        
        //set all spaces to path
        for(int i = 0; i < myMaze.length; i++)
        {
            for(int j = 0; j < myMaze[0].length; j++)
            {
                myMaze[i][j] = path;
            }
        }
        
        //fill maze with hedges
        //following for loop fills outer rows
        for(int i = 0; i < myMaze[0].length; i++)
        {
            myMaze[0][i] = hedge;
            myMaze[myMaze.length-1][i] = hedge;         
        }
        //following for loop fills outer columns
        for(int j = 0; j < myMaze.length; j++)
        {
                myMaze[j][0] = hedge;
                myMaze[j][myMaze[0].length-1] = hedge;
        }
        
        //for every other row, set one random space to path 
        for(int r = 2; r < myMaze.length-2; r += 2)
        {
            for(int c = 0; c < myMaze[0].length-1; c++)
            {
                    myMaze[r][c] = hedge;
            }
            myMaze[r][getRandom()] = path;
        }
        
        //for added complexity, fill one random column with hedges
        //as a result of this addition, the generated maze may or may not be solvable
        //must use variable instead of getRandom() alone to ensure that one single column is filled
        random = getRandom();
        for(int r = 0; r < myMaze.length-1; r++)
        {
            myMaze[r][random] = hedge;
        }
         
        //set a random space in the last row to exit
        myMaze[myMaze.length-1][getRandom()] = exit;
    }
   
    //random number generator
    //generates number between 2 and 2 less than length of the maze (to ensure creation of a clear path)

    public int getRandom()
    {
        return rand.nextInt((myMaze[0].length-2 - 2) + 1) + 2;
    }
  
    //returns a string of the maze to act as a display
    public String unsolvedMazeToString()
    {
        String maze = "";
        
        //prints the maze pre-check 
        for(int i = 0; i < myMaze.length; i++)
        {
            for(int j = 0; j < myMaze[0].length; j++)
            {
                    //path represented as a space rather than 'P' for visual appeal and practicality
                    if(myMaze[i][j] == path)
                        maze+="  ";
                    //hedges and exits are represented by their actual characters
                    else
                        maze+=myMaze[i][j] +" ";
            }
            //separates rows
            maze+= "\r\n" ;  
        }
        return maze; 
    }
    
    public String solvedMazeToString()
    {
    		String maze = "";
    		
    		//prints the maze post-check
            for(int i = 0; i < myMaze.length; i++)
            {
                for(int j = 0; j < myMaze[0].length; j++)
                {
                        //visited[i][j] tracks which path the program takes
                        if(myMaze[i][j] == path && visited[i][j])
                            maze+= "- ";
                        //if the path remains unvisited, represented as a space
                        else if(myMaze[i][j] == path)
                            maze+="  ";
                        //hedges and exits are again represented by their actual characters
                        else
                            maze+=myMaze[i][j] +" ";
                }
                //separates rows
                maze+= "\r\n" ; 
            }    
        return maze;
    }
    

   //recursive maze checker checks whether the maze can be solved and finds a pathway 
   //starting point is given
   public boolean checkMaze(int row, int col)
       { 
           //variable complete used to ensure only one path displayed; only true if exit is found
           boolean complete = false; 
           
           //maze is solved if program reaches exit
           if(myMaze[row][col] == exit)
           {
               return true;
           }
           //user cannot start at a hedge, and program cannot cross through a hedge
           else if(myMaze[row][col] == hedge)
           {
               return false;
           }
           //executes if the path is valid
           else if(isPath(row, col))
           {
               //marks current space as visited, thus creating a pathway 
               visited[row][col] = true;
               
               //following if statements create a pathway based on hedge location, and the spaces cardinal to the current space
               //each statement calls checkMaze, passing one of the valid and unvisited cardinal spaces  
               //variable complete allows program to follow a path, and to then follow a different one if the previous did not work
               //if there is no solution, all if statements will execute and complete will return false; otherwise, complete will return true
               
               //executes if the next space down is valid
               if(isPath(row-1, col) && !visited[row-1][col] && !complete)
               {
                  complete = checkMaze(row-1, col);
               }     
               //executes if the next space up is valid
               if(isPath(row+1, col) && !visited[row+1][col] && !complete)
               {
                  complete = checkMaze(row+1, col);
               } 
               //executes if the next space left is valid
               if(isPath(row, col-1) && !visited[row][col-1] && !complete)
               {
                  complete = checkMaze(row, col-1);
               } 
               //executes if the next space right is valid
               if(isPath(row, col+1) && !visited[row][col+1] && !complete)
               {
                   complete = checkMaze(row, col+1);
               }
           }
           
           //returns whether exit has been reached
           return complete;
       }

       public boolean isPath(int row, int col)
       {
           //checks if the given element is a path and that it is not out of the array's bounds
           return (row < myMaze.length) && (row >= 0) && (col < myMaze[0].length) && (col >= 0);
       }
    }

