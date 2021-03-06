# Locked and Loded
## Description
 Locked and Loded is a top-down 2D shooter game. There will be areas of different magnetic fields either pointing out of or into the screen, as well as walls and pits to stop the player, enemies, or bullets from moving into specific areas. Both the player and enemies will be able to shoot different projectiles such as an electron, or a proton. The magnetic fields will influence the trajectories of these projectiles, making the player take that extra step with the right-hand rule to really figure out how to aim. The goal of this game would be to destroy all of the enemies with a limited amount of projectiles. You lose when one of the enemy's projectiles hit you. However, you will have the option of going back to the level you started to save time.
  Throughout the game, the magnetic fields will change within a given time interval specified on the screen. This allows the player to plan their next move. There are six levels, each with varying difficulty and amount of thinking needed. I hope you enjoy our project!


## Contributors
* Jason Lin
* Mohammed Jamil

## Video Link
[video link](https://www.youtube.com/watch?v=ls81UTVqocI)

## Instructions
To play clone this repository, open one of the .pde files with Processing, and run the program.
Unfortunately, we were unable to put our code up on Open Processing since it required major changes in our code to make it compatible with the interpreter that Open Processing uses. We do pray that it works on your Processing. For reference, we created this project on Processing 3.5.3 and you do not need to install any libraries for this project. Make sure that your Processing is in Java mode in the top right corner.

To move around, you use the WASD keys and to change projectiles, you use the Shift key. There are two options for aiming and shooting:
* Mouse to aim and shoot
* Left and Right arrow keys to aim and the Space key to shoot

**You can choose which one to use through the instructions page.**
Use the controls that fit your situation (e.g., you do not have a mouse).

## Notes
  When you shoot projectiles, they will be able to bounce off of walls once, after which they will lose speed due to an inelastic collision. Upon hitting the walls a second time, the projectiles will lose all of their energy and disappear from the screen as to not lower the frame rate.
  
  The circle path that the projectiles follow is not perfect due to the noncontinuous nature of Processing. In other words, since the program runs at around 60 frames per second if your processor can keep up, the simulation of the path of the particles only estimates that of real life, which has many more frames per second than a computer can simulate.

  The player can only be damaged by the enemies' projectiles and vice versa. The projectiles are different colors so that it is easy to distinguish between who they belong to.
  
## Legend
![alt text](https://github.com/JasonLin43212/Locked-And-Loded/blob/master/export.png)
