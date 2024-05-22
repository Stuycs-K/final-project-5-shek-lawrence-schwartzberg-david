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
    currentPiece = null;
    nextPiece = null;
    nextPieces = new ArrayDeque<TPiece>(4);
    dropSpeed = 0;
    dropX = 0;
    dropY = 0;
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
