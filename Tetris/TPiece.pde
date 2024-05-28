public class TPiece {
  private char[][][] orientations;
  private int state;
  private char pieceType;
  
  public TPiece(char c) {
    if (c == 'I') {
      setI();
    }
    else if (c == 'J') {
      setJ();
    }
    else if (c == 'L') {
      setL();
    }
    else if (c == 'S') {
      setS();
    }
    else if (c == 'Z') {
      setZ();
    }
    else if (c == 'T') {
      setT();
    }
    else if (c == 'O') {
      setO();
    }
    state = 0;
    pieceType = c;
  }
  
  public TPiece clone() {
    TPiece newPiece = new TPiece(this.pieceType);
    newPiece.setState(this.state);
    
    return newPiece;
  }
  
  public char getChar() {
    return this.pieceType;
  }
  
  public void setState(int newState) {
    this.state = newState;
  }
  
  public char[][] getPieceArray() {
    return orientations[state];
  }
  
  public void rotateRight() {
    state = (state + 1) % 4;
  }
  
  public void rotateLeft() {
    state = (state - 1 + 4) % 4;
  }
  
  public void display(float x, float y) {
    char[][] currOrientation = orientations[state];
    
    fill(getColor(pieceType));
    int startRow = getTop();
    int startCol = getLeft();
    for (int r = 0; r < currOrientation.length; r++) {
      for (int c = 0; c < currOrientation[0].length; c++) {
        if (currOrientation[r][c] != '-') {
          rect(x + (SQUARE_SIZE* (c - startCol)), y + (SQUARE_SIZE* (r- startRow)), SQUARE_SIZE, SQUARE_SIZE);
        }
      }
    }
  }
  
  public void display(float x, float y, color fillColor, color strokeColor) {
    char[][] currOrientation = orientations[state];
    
    fill(fillColor);
    stroke(strokeColor);
    int startRow = getTop();
    int startCol = getLeft();
    for (int r = 0; r < currOrientation.length; r++) {
      for (int c = 0; c < currOrientation[0].length; c++) {
        if (currOrientation[r][c] != '-') {
          rect(x + (SQUARE_SIZE * (c - startCol)), y + (SQUARE_SIZE * (r - startRow)), SQUARE_SIZE, SQUARE_SIZE);
        }
      }
    }
  }
  
  public int width() {
      char[][] currOrientation = orientations[state];
      int totalWidth = 0;
      for (int c = 0; c < currOrientation[0].length; c++) {
        for (int r = 0; r < currOrientation.length; r++) {
          if (currOrientation[r][c] != '-') {
            totalWidth++;
            break;
          }
        }
      }
      return totalWidth;
  }
  
  public int height() {
      char[][] currOrientation = orientations[state];
      int totalHeight = 0;
      for (int r = 0; r < currOrientation.length; r++) {
        for (int c = 0; c < currOrientation[0].length; c++) {
          if (currOrientation[r][c] != '-') {
            totalHeight++;
            break;
          }
        }
      }
      return totalHeight;
  }
    
  // returns topmost occupied row of piece array
  public int getTop() {
    char[][] currOrientation = orientations[state];
    for (int r = 0; r < currOrientation.length; r++) {
      for (int c = 0; c < currOrientation[0].length; c++) {
        if (currOrientation[r][c] != '-') {
          return r;
        }
      }
    }
    return -1;
  }
  
  // returns leftmost occupied column of piece array 
  public int getLeft() {
    char[][] currOrientation = orientations[state];
    for (int c = 0; c < currOrientation[0].length; c++) {
      for (int r = 0; r < currOrientation.length; r++) {
        if (currOrientation[r][c] != '-') {
          return c;
        }
      }
    }
    return -1;
  }
  
  private void setI() {
    orientations = new char[][][]
                  {
                   {
                    {'-', '-', '-', '-'},
                    {'I', 'I', 'I', 'I'},
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}  
                   },
                   {
                    {'-', '-', 'I', '-'}, 
                    {'-', '-', 'I', '-'},
                    {'-', '-', 'I', '-'}, 
                    {'-', '-', 'I', '-'}
                   },
                   {
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'},
                    {'I', 'I', 'I', 'I'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'I', '-', '-'}, 
                    {'-', 'I', '-', '-'},
                    {'-', 'I', '-', '-'}, 
                    {'-', 'I', '-', '-'}
                   }
                 };
  }
  
  private void setJ() {
    orientations = new char[][][]
                  {
                   {
                    {'J', '-', '-', '-'},
                    {'J', 'J', 'J', '-'}, 
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'J', 'J', '-'},
                    {'-', 'J', '-', '-'}, 
                    {'-', 'J', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', '-', '-'}, 
                    {'J', 'J', 'J', '-'},
                    {'-', '-', 'J', '-'},
                    {'-', '-', '-', '-'}                    
                   },
                   {
                    {'-', 'J', '-', '-'},
                    {'-', 'J', '-', '-'}, 
                    {'J', 'J', '-', '-'},
                    {'-', '-', '-', '-'}                    
                   }
                 };
  }
  
  private void setL() {
    orientations = new char[][][]
                  {
                   {
                    {'-', '-', 'L', '-'},
                    {'L', 'L', 'L', '-'}, 
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}, 
                   },
                   {
                    {'-', 'L', '-', '-'},
                    {'-', 'L', '-', '-'}, 
                    {'-', 'L', 'L', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', '-', '-'}, 
                    {'L', 'L', 'L', '-'},
                    {'L', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'L', 'L', '-', '-'},
                    {'-', 'L', '-', '-'}, 
                    {'-', 'L', '-', '-'},
                    {'-', '-', '-', '-'}
                   }
                 };
  }
  
  private void setS() {
    orientations = new char[][][]
                  {
                   {
                    {'-', 'S', 'S', '-'},
                    {'S', 'S', '-', '-'}, 
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'S', '-', '-'},
                    {'-', 'S', 'S', '-'}, 
                    {'-', '-', 'S', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', '-', '-'}, 
                    {'-', 'S', 'S', '-'},
                    {'S', 'S', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'S', '-', '-', '-'},
                    {'S', 'S', '-', '-'}, 
                    {'-', 'S', '-', '-'},
                    {'-', '-', '-', '-'}
                   }
                 };
  }
  
  private void setZ() {
    orientations = new char[][][]
                  {
                   {
                    {'Z', 'Z', '-', '-'},
                    {'-', 'Z', 'Z', '-'}, 
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', 'Z', '-'},
                    {'-', 'Z', 'Z', '-'}, 
                    {'-', 'Z', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', '-', '-'}, 
                    {'Z', 'Z', '-', '-'},
                    {'-', 'Z', 'Z', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'Z', '-', '-'},
                    {'Z', 'Z', '-', '-'}, 
                    {'Z', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   }
                 };
  } 
  
  private void setT() {
    orientations = new char[][][]
                  {
                   {
                    {'-', 'T', '-', '-'},
                    {'T', 'T', 'T', '-'}, 
                    {'-', '-', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'T', '-', '-'},
                    {'-', 'T', 'T', '-'}, 
                    {'-', 'T', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', '-', '-', '-'},
                    {'T', 'T', 'T', '-'}, 
                    {'-', 'T', '-', '-'},
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'-', 'T', '-', '-'},
                    {'T', 'T', '-', '-'}, 
                    {'-', 'T', '-', '-'},
                    {'-', '-', '-', '-'}
                   }
                 };
  } 
  
  private void setO() {
    orientations = new char[][][]
                  {
                   {
                    {'O', 'O', '-', '-'}, 
                    {'O', 'O', '-', '-'},
                    {'-', '-', '-', '-'}, 
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'O', 'O', '-', '-'}, 
                    {'O', 'O', '-', '-'},
                    {'-', '-', '-', '-'}, 
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'O', 'O', '-', '-'}, 
                    {'O', 'O', '-', '-'},
                    {'-', '-', '-', '-'}, 
                    {'-', '-', '-', '-'}
                   },
                   {
                    {'O', 'O', '-', '-'}, 
                    {'O', 'O', '-', '-'},
                    {'-', '-', '-', '-'}, 
                    {'-', '-', '-', '-'}
                   }
                 };
  }
}
