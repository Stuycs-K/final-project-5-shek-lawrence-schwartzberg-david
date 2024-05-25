# Work Log

## David Schwartzberg

### 5/22

Set up the Board class's instance variables, constructor, and display(). 
In the main Tetris file, added the keyCodes for the basic rotation and store-piece keys.

### 5/23

Added a display function for the current TPiece in the Board class. 
Changed the TPiece arrays to start from top left instead of bottom left(for simplicity, no effect on game).
Added the Controller class to deal with all inputs, and made down arrow soft drop the current piece. 
The piece also automatically moves down now, stops when it reaches the bottom, and adds its data to the board array.

### 5/24

Added smooth keyboard input(using booleans).
Added hardDrop. 
Added display for shadows.

## Lawrence Shek

### 5/22

- Created constructor for TPiece, wrote all orientations for each piece. 
- Added methods to rotate pieces (does not check if rotation is valid yet).  

### 5/23

- Added checking for collisions between pieces
- Added control for moving pieces left/right in the board


### 5/24
- added line clearing
- in board class: made it so that currentRow represents topmost row of the piece, currentCol represents leftmost col of piece
  - the rotations are somewhat working better but checking collisions might be more broken 
