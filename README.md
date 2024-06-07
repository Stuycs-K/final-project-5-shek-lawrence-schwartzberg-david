[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# Tetris

## Made by the Tetromino Titans 
David Schwartzberg and Lawrence Shek

## Overview
Play Tetris - complete with moving left and right, rotating clockwise and counterclockwise, soft-drops and hard-drops, and storing pieces. Go to settings to change your controls if you want, and then go back to the main menu and hit play! Try to clear as many lines as possible to increase your level and get a high score!

## Instructions

### To Run the Project: 
(No libraries required) <br>
Open in Processing and run the project!

### How to Play:

#### Basic controls:
| Action | Key |
|:------:|:---:|
| Move Left | Left Arrow |
| Move Right | Right Arrow |
| Soft Drop | Down Arrow |
| Hard Drop | Space |
| Rotate Left | Z |
| Rotate Right | X |
| Store Piece | C |
| Pause Game | P | 

If you want to change any of these, from the main menu click "Settings" and click the action you want to set to a new key. Then press that key and you'll be able to press that key in-game to perform that action. <br>

#### Explanation of other features: 
Storing a piece is only allowed once a turn. Doing so will gray out that piece, indicating that you can't switch it out again. <br>

Every 5 lines, the level will increase by 1. The level corresponds to the natural drop speed of the game, making it harder as you clear more lines. <br>

The amount of points you get corresponds to the amount of lines cleared in a single drop and your current level, shown by the table below($n=$ level): <br>

| 1 line | 2 lines | 3 lines | 4 lines |
|:------:|:-------:|:-------:|:-------:|
|$(n+1)*40$|$(n+1)*100$|$(n+1)*300$|$(n+1)*1200$|