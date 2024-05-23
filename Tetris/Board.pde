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
    resetCurrentRowAndCol();
    
    heldPiece = null;
    nextPieces = new ArrayDeque<TPiece>(3);
    nextPieces.add(createNewTPiece());
    nextPieces.add(createNewTPiece());
    nextPieces.add(createNewTPiece());
    
    dropSpeed = 0;
    dropX = 0;
    dropY = 0;
    
    //// test
    currentPiece = new TPiece('T');
    //board[5][5] = 'O';
    //board[5][6] = 'O';
    //board[6][5] = 'O';
    //board[6][6] = 'O';
  }
  
  private char[][] makeBoard(int boardWidth, int boardHeight) {
    char[][] newBoard = new char[boardWidth][boardHeight];
    
    for (int r = 0; r < newBoard.length; r++) {
      for (int c = 0; c < newBoard[0].length; c++) {
        newBoard[r][c] = '-';
      }
    }
    return newBoard;
  }
  
  private void resetCurrentRowAndCol() {
    currentRow = 0;
    currentCol = board[0].length/2;
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
    if (this.pieceCanMove()) {
      currentRow++;
    } else {
      println("PIECE CAN'T GO FURTHER");
      changeToNextPiece();
    }
  }
  
  // called when the current piece has reached the bottom of the board
  private void changeToNextPiece() {
    // function here to add the current piece's data into the board array
    addCurrentPieceToBoard();
    
    currentPiece = nextPieces.remove();
    nextPieces.add(createNewTPiece());
    
    resetCurrentRowAndCol();
  }
  
  // assumes that the piece does not overlap with any other pieces or the board border
  public void addCurrentPieceToBoard() {
    char[][] pieceArray = currentPiece.getPieceArray();
    
    for (int r = 0; r < pieceArray.length; r++) {
      for (int c = 0; c < pieceArray[0].length; c++) {
        if (pieceArray[r][c] != '-') {
          board[currentRow+r][currentCol+c] = pieceArray[r][c];
        }
      }
    }
  }
    
  
  // CHANGE LATER TO ALSO ACCOUNT FOR OTHER PIECES
  // returns true if the piece has room to move down again
  // returns false if the piece is either at the bottom of the board, or touching another piece
  public boolean pieceCanMove() {
    char[][] pieceArray = currentPiece.getPieceArray();
    
    for (int r = 0; r < pieceArray.length; r++) {
      for (int c = 0; c < pieceArray[0].length; c++) {
        if (pieceArray[r][c] != '-') {
          // +1 to check NEXT position
          if ((currentRow + r) + 1 >= board.length) {
            return false;
          }
        }
      }
    }
    
    return true;
  }
  
}
