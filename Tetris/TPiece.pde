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
  
  public char getChar() {
    return this.pieceType;
  }
  
  public char[][] getPieceArray() {
    return orientations[state];
  }
  
  public void rotateClockwise() {
    state = (state + 1) % 4;
  }
  
  public void rotateCounterClockwise() {
    state = (state - 1 + 4) % 4;
  }
  
  public void display(float x, float y) {
    char[][] currOrientation = orientations[state];
    
    fill(getColor(pieceType));
    
    for (int r = 0; r < currOrientation.length; r++) {
      for (int c = 0; c < currOrientation[0].length; c++) {
        if (currOrientation[r][c] != '-') {
          rect(x + (SQUARE_SIZE*c), y + (SQUARE_SIZE*r), SQUARE_SIZE, SQUARE_SIZE);
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
    
  
  private void setI() {
    orientations = new char[][][]
                  {
                   {
                    {'I', 'I', 'I', 'I'},
                   },
                   {
                    {'-', '-', 'I', '-'}, 
                    {'-', '-', 'I', '-'},
                    {'-', '-', 'I', '-'}, 
                    {'-', '-', 'I', '-'}
                   },
                   {
                    {'I', 'I', 'I', 'I'},
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
