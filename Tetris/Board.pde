import java.util.ArrayDeque;

public class Board {
  private char[][] board;
  
  private TPiece currentPiece;
  private TPiece heldPiece;
  private ArrayDeque<TPiece> nextPieces;
  
  private int dropSpeed;
  private int dropX, dropY;
  
  public Board(int boardWidth, int boardHeight) {
    board = makeBoard(boardWidth, boardHeight);
    
    currentPiece = createNewTPiece();
    heldPiece = null;
    nextPieces = new ArrayDeque<TPiece>(4);
    
    dropSpeed = 0;
    dropX = 0;
    dropY = 0;
    
    currentPiece = new TPiece('T');
  }
  
  public char[][] makeBoard(int boardWidth, int boardHeight) {
    char[][] newBoard = new char[boardWidth][boardHeight];
    
    for (int r = 0; r < newBoard.length; r++) {
      for (int c = 0; c < newBoard[0].length; c++) {
        newBoard[r][c] = '-';
      }
    }
    
    return newBoard;
  }
  
  // display the board relative to the window
  public void display(float x, float y) {
    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        fill(140);
        rect(x + (SQUARE_SIZE*c), y + (SQUARE_SIZE*r), SQUARE_SIZE, SQUARE_SIZE);
      }
    }
  }
  
  // display the current piece relative to the BOARD
  public void displayCurrentPiece(int row, int col) {
    currentPiece.display(boardX + SQUARE_SIZE*col, boardY + SQUARE_SIZE*row);
  }
  
}