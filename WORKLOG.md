# Work Log

## David Schwartzberg

### 5/22

- Set up the Board class's instance variables, constructor, and display(). 
- In the main Tetris file, added the keyCodes for the basic rotation and store-piece keys.

### 5/23

- Added a display function for the current TPiece in the Board class. 
- Changed the TPiece arrays to start from top left instead of bottom left(for simplicity, no effect on game).
- Added the Controller class to deal with all inputs, and made down arrow soft drop the current piece. 
- The piece also automatically moves down now, stops when it reaches the bottom, and adds its data to the board array.

### 5/24

- Added smooth keyboard input(using booleans).
- Added hardDrop. 
- Added display for shadows.

### 5/26

- Implemented switching and holding pieces
- Made board display the held and next pieces, and switched from an ArrayDeque to LinkedList for nextPieces

### 5/27

- Fixed switching pieces using nextPieces instead of the heldPiece
- Added lose condition, did not actually make the game end
- Implemented the 7 pieces in a bag randomization
- Made displaying next pieces look nice

### 5/28

- Added lose condition
- Made a Button class and a start over button
- Made holding hard drop not do it multiple times

### 5/29

- Fixed randomization of next pieces
- Fixed harddropping bug

### 5/30

- Added basic score system
- Added levels

### 5/31

- Tried debugging, did not work
- Fixed scoring
- Made levels increase speed over time

### 6/3

- Fixed pieces spawning weirdly
- Changed leveling system a little bit
- Made held pieces grayed out to indicate they can't be switched that turn

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

### 5/25
- fixed bugs with piece dropping and going out of bounds
- updated drop shadow to account for pieces that were in the way

### 5/26
- fixed piece rotation
  - added method to adjust positions of pieces going out of bounds from rotating
  - fixed issue of x position of pieces increasing after multiple consecutive rotations 

### 5/27
did nothing

### 5/28
- changed appearance of drop shadow (transparent background instead of only having outline)
- added delay for adding pieces to board when they can no longer move down
- fixed drop shadow when switching to held pieces

### 5/29
I spent the day debugging

did not fix anything

### 5/30
- tried to fix rotating piece eating other pieces
- did not fix it

### 5/31
- added button for menu screen
- made it possible to pause game
- moved board related logic in Tetris class to a Game class

### 6/1
- added menu screen with working play button
- made code in Tetris and Game class more organized

### 6/2
- added background to game and menu
- changed colors of pieces and board
- (hopefully) fixed rotating pieces eating others 
