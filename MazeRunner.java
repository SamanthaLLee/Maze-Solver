package maze;
import java.util.Scanner;

public class MazeRunner
{
    private static Scanner sc;

	public static void main(String[] args)
    {
		sc = new Scanner(System.in);    
        int rows, cols, rowStart, colStart, input;
        
        System.out.println("Maze: Generate and Solve");
        
        System.out.println("How many rows does the maze have?");
        rows = sc.nextInt();
        System.out.println("How many columns does the maze have?");
        cols = sc.nextInt();
        
        Maze myMaze = new Maze(rows, cols);
        System.out.println(myMaze.unsolvedMazeToString());
        
        System.out.println("Enter 1 to continue or enter 2 to generate a different maze.");
        input = sc.nextInt();
        
        while(input == 2)
        {
        		myMaze.fill();
        		System.out.println(myMaze.unsolvedMazeToString());
        		System.out.println("Enter 1 to continue or enter 2 to generate a different maze.");
            input = sc.nextInt();
        }
        
        while(input != 1)
        {
        		System.out.println("Enter 1 to continue or enter 2 to generate a different maze.");
            input = sc.nextInt();
        }
        
        if (input == 1)
        {
        		System.out.println("In what row would you like to start?");
            rowStart = sc.nextInt();
            System.out.println("In what column would you like to start?");
            colStart = sc.nextInt();
            
            while (rowStart < 0 || rowStart > rows || colStart < 0 || colStart > cols)
            {
                System.out.println("Invalid input. Point must be within bounds. ");
                System.out.println("In what row would you like to start?");
                rowStart = sc.nextInt();
                System.out.println("In what column would you like to start?");
                colStart = sc.nextInt();
            }
           
            System.out.println("Result: " +myMaze.checkMaze(rowStart, colStart));
            System.out.println(myMaze.solvedMazeToString());      
        }
        
        
        
    }

}
