import java.util.ArrayDeque;

public class Board {
  private char[][] board;
  
  private TPiece currentPiece;
  private int currentRow, currentCol;
  
  private TPiece heldPiece;
  private ArrayDeque<TPiece> nextPieces;
  
  private int dropX, dropY;
  
  public Board(int numRows, int numCols) {
    board = makeBoard(numRows, numCols);
    
    currentPiece = createNewTPiece();
    currentRow = 0;
    currentCol = numCols/2;
    
    heldPiece = null;
    nextPieces = new ArrayDeque<TPiece>(4);
    
    dropSpeed = 0;
    dropX = 0;
    dropY = 0;
    
    // test
    currentPiece = new TPiece('T');
    board[5][5] = 'O';
    board[5][6] = 'O';
    board[6][5] = 'O';
    board[6][6] = 'O';
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
        fill(getColor(board[r][c]));
        
        rect(x + (SQUARE_SIZE*c), y + (SQUARE_SIZE*r), SQUARE_SIZE, SQUARE_SIZE);
      }
    }
  }
  
  // display the current piece relative to the BOARD
  public void displayCurrentPiece() {
    currentPiece.display(boardX + SQUARE_SIZE*currentCol, boardY + SQUARE_SIZE*currentRow);
  }
  
  // display the current piece's dropping location
  public void displayShadow() {
    // fix this later
    
  }
   
  // current piece goes down a tile
  // can be called more/less often in order to increase/decrease difficulty
  public void tick() {
    currentRow++;
  }
  
}
