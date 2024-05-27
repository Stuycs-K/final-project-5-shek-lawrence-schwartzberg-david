import java.util.LinkedList;
import java.util.Collections;

public class Board {
  private char[][] board;
  
  private TPiece currentPiece;
  
  private int currentPieceHeight, currentPieceWidth;
  private int currentPieceRow = 0, currentPieceCol = 0;
  private int currentRow, currentCol;
  
  private TPiece heldPiece;
  boolean pieceHasBeenSwitchedThisTurn;
  
  private LinkedList<TPiece> nextPieces;
  
  private int shadowRow;
  
  private boolean lose;
  
  public Board(int numRows, int numCols) {
    board = makeBoard(numRows, numCols);
    
    currentPiece = createNewTPiece();
    
    resetCurrentRowAndCol();
    
    heldPiece = null;
    pieceHasBeenSwitchedThisTurn = false;
    
    nextPieces = new LinkedList<TPiece>();
    addToNextPieces();
    
    updatePiece();
        
    dropSpeed = 0;
    shadowRow = board.length - currentPieceHeight;
    updateShadow();
    
  }
  
  private char[][] makeBoard(int boardHeight, int boardWidth) {
    char[][] newBoard = new char[boardHeight][boardWidth];
    
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
    stroke(BLACK);
    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        fill(getColor(board[r][c]));
        
        rect(x + (SQUARE_SIZE*c), y + (SQUARE_SIZE*r), SQUARE_SIZE, SQUARE_SIZE);
      }
    }
  }
  
  // display the current piece relative to the BOARD
  public void displayCurrentPiece() {
    stroke(BLACK);
    currentPiece.display(boardX + SQUARE_SIZE*currentCol, boardY + SQUARE_SIZE*currentRow);
  }
  
  // display the current piece's dropping location
  public void displayShadow() {
    currentPiece.display(boardX + SQUARE_SIZE*currentCol, boardY + SQUARE_SIZE*shadowRow, GRAY, getColor(currentPiece.getChar()));
  }
  
  public void displayHeldPiece() {
    fill(GRAY);
    stroke(BLACK);
    rect(boardX - SQUARE_SIZE*5, boardY, SQUARE_SIZE*5, SQUARE_SIZE*5);
    
    if (heldPiece != null) {
      char c = heldPiece.getChar();
      
      switch(c) {
        case 'I':
          heldPiece.display(boardX - SQUARE_SIZE*3, boardY + SQUARE_SIZE*0.5);
          break;
          
        case 'O':
          heldPiece.display(boardX - SQUARE_SIZE*3.5, boardY + SQUARE_SIZE*1.5);
          break;
          
        default:
          heldPiece.display(boardX - SQUARE_SIZE*4, boardY + SQUARE_SIZE);
          break;
      }
    }
  }
  
  public void displayNextPieces() {
    nextPieces.get(0).display(boardX + SQUARE_SIZE*(board[0].length+1), boardY);
    nextPieces.get(1).display(boardX + SQUARE_SIZE*(board[0].length+1), boardY + SQUARE_SIZE*4);
    nextPieces.get(2).display(boardX + SQUARE_SIZE*(board[0].length+1), boardY + SQUARE_SIZE*8);
  }
   
  // current piece goes down a tile
  // can be called more/less often in order to increase/decrease difficulty
  public void softDrop() {
    if (pieceCanMoveDown(currentRow, currentCol)) {
      currentRow++;
    } else {
      changeToNextPiece(true);
    }
  }
  
  public void hardDrop() {
    while (pieceCanMoveDown(currentRow, currentCol)) {
      softDrop();
    }
    
    changeToNextPiece(true);
  }
  
  // called when the current piece has reached the bottom of the board
  // boolean for switchPiece() to call this without adding the piece to the board
  private void changeToNextPiece(boolean addCurrentPieceToBoard) {
    if (currentRow == 0) {
      lose = true;
    }
    
    if (addCurrentPieceToBoard) {
      addCurrentPieceToBoard();
      pieceHasBeenSwitchedThisTurn = false;
    }
    
    currentPiece = nextPieces.remove(0);
    if (nextPieces.size() <= 3) {
      addToNextPieces();
    }
    
    resetCurrentRowAndCol();
    updatePiece();
    updateShadow();
  }
  
  public boolean checkIfLost() {
    return lose;
  }
  
  public void switchPiece() {
    if (!pieceHasBeenSwitchedThisTurn) {
      if (heldPiece != null) {
        TPiece temp = heldPiece;
        heldPiece = currentPiece;
        if (heldPiece.getChar() == 'I') {
          heldPiece.setState(1); // vertical
        }
        
        currentPiece = temp;
        resetCurrentRowAndCol();
        pieceHasBeenSwitchedThisTurn = true;
      } else {
        heldPiece = currentPiece;
        if (heldPiece.getChar() == 'I') {
          heldPiece.setState(1); // vertical
        }
        
        changeToNextPiece(false);
        pieceHasBeenSwitchedThisTurn = true;
      }
    } 
    
  }
  
  // assumes that the piece does not overlap with any other pieces or the board border
  public void addCurrentPieceToBoard() {
    char[][] pieceArray = currentPiece.getPieceArray();
    
    for (int r = 0; r < currentPieceHeight; r++) {
      for (int c = 0; c < currentPieceWidth; c++) {
        if (pieceArray[currentPieceRow + r][currentPieceCol + c] != '-') {
          board[currentRow+r][currentCol+c] = pieceArray[currentPieceRow + r][currentPieceCol + c];
        }
      }
    }
  }
  
  // 7 pieces in a "bag"
  public void addToNextPieces() {
    LinkedList<TPiece> bag = new LinkedList<TPiece>();
    for (int i = 0; i < 7; i++) {  
      char c = "IJLSZTO".charAt(i);
      bag.add(new TPiece(c));
    }
    
    Collections.shuffle(bag);
    
    for (int i = 0; i < bag.size(); i++) {
      nextPieces.add(bag.remove(0));
    }
  }
  
  // CHANGE LATER TO ALSO ACCOUNT FOR OTHER PIECES
  // returns true if the piece has room to move down again
  // returns false if the piece is either at the bottom of the board, or touching another piece
  public boolean pieceCanMoveDown(int row, int col) {
    if (row + currentPieceHeight >= board.length) {
      return false;
    }
    
    char[][] pieceArray = currentPiece.getPieceArray();
    for (int r = 0; r < currentPieceHeight; r++) {
      for (int c = 0; c < currentPieceWidth; c++) {
        if (pieceArray[currentPieceRow + r][currentPieceCol + c] != '-' && collidesWithPiece(row + 1, col)) {
            return false;
        }
      }
    }
    
    return true;
  }
  
  private boolean collidesWithPiece(int row, int col) {
    char[][] pieceArray = currentPiece.getPieceArray();
    for (int r = 0; r < currentPieceHeight; r++) {
      for (int c = 0; c < currentPieceWidth; c++) {
        if (pieceArray[currentPieceRow + r][currentPieceCol + c] != '-' && (row+r < board.length) && (col+c < board[0].length) && board[row + r][col + c] != '-') {
          return true;
        }
      }
    }
    return false;
  }
  
  public void movePieceLeft() {
    if (currentCol > 0 && !collidesWithPiece(currentRow, currentCol - 1)) {
      currentCol--;
      updateShadow();
    }
  }
  
  public void movePieceRight() {
    if (currentCol + currentPieceWidth < board[0].length && !collidesWithPiece(currentRow, currentCol + 1)) {
      currentCol++;
      updateShadow();
    }
  }
  
  public void clearLines() {
    for (int r = board.length - 1; r >= 0; r--)  {
      boolean fullLine = true;
      for (int c = 0; c < board[0].length; c++) {
        if (board[r][c] == '-') {
          fullLine = false;
          break;
        }
      }
      if (fullLine) {
        shiftDown(r);
      }
    }
  }
  
  private void shiftDown(int bottom) {
    for (int r = bottom; r > 0; r--) {
      board[r] = board[r - 1];
    }
  }
  
  public void rotatePieceLeft() {
    currentPiece.rotateLeft();
    updatePiece();
    updateShadow();
    if (collidesWithPiece(currentRow, currentCol)) {
      currentPiece.rotateRight();
      updatePiece();
      updateShadow();
    }
    adjustBorderRotation();
  }

  public void rotatePieceRight() {
    currentPiece.rotateRight();
    updatePiece();
    updateShadow();
    if (collidesWithPiece(currentRow, currentCol)) {
      currentPiece.rotateLeft();
      updatePiece();
      updateShadow();
    }    
    adjustBorderRotation();
  }
  
  private void adjustBorderRotation() {
    while (currentCol < 0) {
      currentCol++;
    }
    while (currentCol + currentPieceWidth - 1 >= board[0].length) {
      currentCol--;
    }
  }
  
  
  // called whenever a piece is moved or rotated
  private void updateShadow() {
    int newShadowRow = currentRow;
    
    while (pieceCanMoveDown(newShadowRow, currentCol)){
      newShadowRow++;
    }
    
    shadowRow = newShadowRow;
  }
  
  private void updatePiece() {
    currentPieceHeight = currentPiece.height();
    currentPieceWidth = currentPiece.width();
    
    currentRow = max(currentRow - currentPieceRow, 0);
    currentCol = max(currentCol - currentPieceCol, 0);
        
    currentPieceRow = currentPiece.getTop();
    currentPieceCol = currentPiece.getLeft();
    

    currentRow += currentPieceRow;
    currentCol += currentPieceCol;
    
  }

}
