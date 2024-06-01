import java.util.LinkedList;
import java.util.Collections;
import java.util.Arrays;

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
  
  private int addPieceDelay = 60;
  private int addPieceCountdown;
  
  private int score;
  private int level;
  private int totalLinesCleared;
  
  
  public Board(int numRows, int numCols) {
    board = makeBoard(numRows, numCols);
    
    resetCurrentRowAndCol();
    
    heldPiece = null;
    pieceHasBeenSwitchedThisTurn = false;
    
    nextPieces = new LinkedList<TPiece>();
    addToNextPieces();
    currentPiece = nextPieces.remove(0);
    
    updatePiece();
        
    dropSpeed = 0;
    shadowRow = board.length - currentPieceHeight;
    updateShadow();
    
    score = 0;
    level = 0;
    totalLinesCleared = 0;
  }
  
  // debugging
  public void printStuff() {
    println("currentPiece: " + currentPiece);
    println("currentPieceHeight, currentPieceWidth: " + currentPieceHeight + ", " + currentPieceWidth);
    printArray();
  }
  
  public void printArray() {
    for (int i = 0; i < board.length; i++) {
      print("[");
      for (int j = 0; j < board[i].length; j++) {
        print(board[i][j]);
        if (j != board[i].length-1) {
          print(", ");
        }
      }
      if (i != board.length-1) {
          print("]\n");
        }
    }
    print("]\n");
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
  
  public void displayScore(float x, float y) {
    fill(BLACK);
    stroke(BLACK);
    textAlign(CENTER, TOP);
    textSize(25);
    text("Score: " + score + "\nLevel: " + level + "\nLines: " + totalLinesCleared, x, y);
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
    color pieceColor = getColor(currentPiece.getChar());
    currentPiece.display(boardX + SQUARE_SIZE*currentCol, boardY + SQUARE_SIZE*shadowRow, color(pieceColor, 75), pieceColor);
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
    for (int i = 0; i < 3; i++) {
      fill(GRAY);
      stroke(BLACK);
      rect(boardX + SQUARE_SIZE*10, boardY + SQUARE_SIZE*(i*5), SQUARE_SIZE*5, SQUARE_SIZE*5);
      
      TPiece piece = nextPieces.get(i);
      char c = piece.getChar();
      
      switch(c) {
        case 'I':
          piece.setState(1);
          piece.display(boardX + SQUARE_SIZE*12, boardY + SQUARE_SIZE*0.5 + SQUARE_SIZE*(i*5));
          break;   
          
        case 'O':
          piece.display(boardX + SQUARE_SIZE*11.5, boardY + SQUARE_SIZE*1.5 + SQUARE_SIZE*(i*5));
          break;
          
        default:
          piece.display(boardX + SQUARE_SIZE*11, boardY + SQUARE_SIZE + SQUARE_SIZE*(i*5));
          break;
      }
    }
      
  }
   
  // current piece goes down a tile
  // can be called more/less often in order to increase/decrease difficulty
  public void softDrop() {
    println("softDrop called");
    if (pieceCanMoveDown(currentRow, currentCol)) {
      currentRow++;
      addPieceCountdown = addPieceDelay;
      updateShadow();
    } else {
      // less delay if holding down softdrop
      addPieceCountdown = min(addPieceCountdown, addPieceDelay / 2);
      changeToNextPiece(true);
    }
  }
  
  public void hardDrop() {
    println("hardDrop called");
    while (pieceCanMoveDown(currentRow, currentCol)) {
      softDrop();
    }
    addPieceCountdown = 0;
    changeToNextPiece(true);
  }
  
  // called when the current piece has reached the bottom of the board
  // boolean for switchPiece() to call this without adding the piece to the board
  private void changeToNextPiece(boolean addCurrentPieceToBoard) {
    println("changetonextpiece called \naddCurrentPieceToBoard: "+addCurrentPieceToBoard);
    println("pieceHasBeenSwitchedThisTurn: " +pieceHasBeenSwitchedThisTurn);
    if (currentRow == 0 && !pieceCanMoveDown(currentRow, currentCol)) {
      lose = true;
      println("lose = true");
    }
    
    if (addCurrentPieceToBoard) {
      // only change piece and add to board if addPieceDelay time has passed after hitting bottom of board or landing on another piece
      if (addPieceCountdown > 0) {
        return;
      }
      addCurrentPieceToBoard();
      pieceHasBeenSwitchedThisTurn = false;
    }
    
    currentPiece = nextPieces.remove(0);
    if (nextPieces.size() <= 3) {
      addToNextPieces();
    }
    
    resetCurrentRowAndCol();
    updatePiece();
    updatePiece();
    updatePiece();
    updatePiece();
    updatePiece();
    updateShadow();
  }
  
  public boolean checkIfLost() {
    return lose;
  }
  
  public void switchPiece() {
    println("switchPiece called");
    if (!pieceHasBeenSwitchedThisTurn) {
      if (heldPiece != null) {
        TPiece temp = heldPiece;
        heldPiece = currentPiece;
        if (heldPiece.getChar() == 'I') {
          heldPiece.setState(1); // vertical
        } else {
          heldPiece.setState(0);
        }
        
        currentPiece = temp;
        currentPiece.setState(0);
        resetCurrentRowAndCol();
        updatePiece();
        pieceHasBeenSwitchedThisTurn = true;
        updatePiece();
        updateShadow();
      } else {
        heldPiece = currentPiece;
        if (heldPiece.getChar() == 'I') {
          heldPiece.setState(1); // vertical
        } else {
          heldPiece.setState(0);
        }
        
        changeToNextPiece(false);
        pieceHasBeenSwitchedThisTurn = true;
        updatePiece();
        updateShadow();
      }
    } 
    
  }
  
  // assumes that the piece does not overlap with any other pieces or the board border
  public void addCurrentPieceToBoard() {
    println("addCurrentPieceToBoard called");
    char[][] pieceArray = currentPiece.getPieceArray();
    
    println("currentPiece: " + currentPiece);
    println(currentPieceHeight + " height");
    println(currentPieceWidth + " width");
    println(currentPieceRow + " currentPieceRow");
    println(currentPieceCol + " currentPieceCol");
    for (int r = 0; r < currentPieceHeight; r++) {
      for (int c = 0; c < currentPieceWidth; c++) {
        if (pieceArray[currentPieceRow + r][currentPieceCol + c] != '-') {
          board[currentRow+r][currentCol+c] = pieceArray[currentPieceRow + r][currentPieceCol + c];
        }
      }
    }
    
    clearLines();
  }
  
  // 7 pieces in a "bag"
  public void addToNextPieces() {
    LinkedList<TPiece> bag = new LinkedList<TPiece>();
    for (int i = 0; i < 7; i++) {  
      char c = "IJLSZTO".charAt(i);
      bag.add(new TPiece(c));
    }
    
    Collections.shuffle(bag);
    
    // pieces aren't repeated
    if (nextPieces.size() > 0 && nextPieces.get(nextPieces.size()-1).getChar() == bag.get(0).getChar()) {
      TPiece temp = bag.get(0);
      bag.set(0, bag.get(bag.size()-1));
      bag.set(bag.size()-1, temp);
    }
    
    for (int i = 0; i < bag.size(); i++) {
      nextPieces.add(bag.get(i));
    }
  }
  

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
    println("clearLines called");
    int numLines = 0;
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
        r++;
        numLines++;
      }
    }
    
    updateShadow();
    
    updateScore(numLines);
    
    totalLinesCleared += numLines;
    
    int oldLevel = level;
    level = totalLinesCleared / 5; // 5 lines per level
    
    if (level > oldLevel) {
      dropSpeed = max(dropSpeed-5, 5);
    }
  }
  
  private void shiftDown(int bottom) {
    println("shiftdown called with bottom: "+ bottom);
    for (int r = bottom; r > 0; r--) {
      board[r] = board[r - 1];
    }
  }
  
  // https://tetris.wiki/Scoring#Original_Nintendo_scoring_system
  private void updateScore(int numLines) {
    if (numLines <= 0){
      return;
    } 
    if (numLines == 1) {
      score += 40 * (level+1);
    } else if (numLines == 2) {
      score += 100 * (level+1);
    } else if (numLines == 3) {
      score += 300 * (level+1);
    } else if (numLines == 4) {
      score += 1200 * (level+1);
    } else {
      score += 1200;
    }
  }
    
  
  public void rotatePieceLeft() {
    currentPiece.rotateLeft();
    updatePiece();
    if (collidesWithPiece(currentRow, currentCol)) {
      currentPiece.rotateRight();
      updatePiece();
    } else {
      adjustBorderRotation();
    }
    updateShadow();

  }

  public void rotatePieceRight() {
    currentPiece.rotateRight();
    updatePiece();
    if (collidesWithPiece(currentRow, currentCol)) {
      currentPiece.rotateLeft();
      updatePiece();
    } else {
      adjustBorderRotation();
    }
    updateShadow();

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
    if (newShadowRow != currentRow) {
      addPieceCountdown = addPieceDelay;
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

  public void decrementPieceCountdown() {
    addPieceCountdown--;
  }
}
