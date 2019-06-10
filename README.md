# MKS22X-FinalProject_PvZ
## Plants v. Zombies
  This is supposed to be an attempt to be a recreation of the PopCap Game "Plants vs. Zombies". Here we are to defend an arbitrary house against hordes of zombies for the protection of your brains. With only plants at your disposal to defend yourself. However, in this case, only the basics will be provided to protect against normal zombies. Good luck. (Especially with bugs)

## How to play
  From the start, the game immediately begins, and you have 50 sun to begin with.
    Sun will periodically drop from the sky (around 10 seconds)
    There are only two plants from the game available in this endless mode: the PeaShooter and the SunFlower. Both invaluable in this case.
    The SunFlower costs 50 sun and the PeaShooter costs 100 sun.
    The first zombie comes around 30 seconds, in which you have time to build up a defense.

    Simply click on a plant in the top menu and click near on the lawn to place it, provided you have enough sun to do so.

    Tips:
      - Build up your sun production
      - Your sun will decay on the ground, better pick it up
      - Pressing "p" will give you 5000 sun
      - Pressing "o" will give you no time to prepare

  Here you do not have lawnmowers, since you need to buy them, and not with circles that look like suns. You need money, but we do not accept any form of currency as legal tender (yes we are the new government)

## Development Log
# Monday May 20th
-Brandon
  - Research about the technicalities behind the game and experimented with the mouse functions
  - Added initial images for easier initial work

-Joyce
  - Created the playing field and background graphics for the game, including the grid and the sun counter
  - Created a 2D array to represent the field and it's open spots
# Tuesday May 21st
-Brandon
  - Research into button

-Joyce
  - Researched timers in processing
  - Experimenting on the random generation of suns
# Wednesday May 22nd
-Brandon
  - Continued with mouse pressing, perfecting a click and drop function
  - Created the other classes as according to the base prototype

-Joyce
  - Created suns at random locations, however, they all fall simultaneously
# Thursday May 23rd
-Brandon
  - Completed MousePressing for duplication of an object, which will be useful for plant placing
  - Cannot access processing due to family member for the night
# Friday May 24th
-Joyce
  - Created zombie class and basic walking path, need to restrict it to be within the grid
  - Create arraylists display and movable to stop redundancies in draw function

# Monday May 27th
-Brandon
  - Started edits to make a shovel interaction, though needs to clean up code to make sense
# Tuesday May 28th
-Brandon
  -Started basic timer class, needs to be specialized

-Joyce
  - Collection of suns through clicks - currently only collects the first sun you click on
  - Fixed the spawn locations of zombies
  - Made the suns and the zombies appear at different intervals
# Wednesday May 29th
-Joyce
  - Fixed issue with the collection of suns
  - Created a tester class to stand in for plants to test the zombies' functions (doesn't stop when it encounters a plant, but the plant's HP does decrease)

# Thursday May 30th

-Brandon
  - Work on projectiles in making them detect when they hit something and finding the closest target (zombie)
  - Preliminary exploration into PeaShooter

# Friday May 31st

-Cooperative
  - Got zombies unstuck after eating a plant, mainly due to a boolean not being changed back when not next to the plant.
  - Combined mousepressing elements with test, was stuck due to having an not(!=) instead of (==)

# Saturday June 1st

-Brandon
  - suntimer for every 10 seconds of game time, a sun will drop, needs to be despawnable too oops
  - plant cooldown structure
  - rethinking on how centering would work

# Sunday June 2nd

-Joyce
  -Created a bullet class
  -Created a timer for the bullets' generation
  -Added damage function to the bullets, only works on non-moving zombies

# Tuesday June 4th

-Brandon
  - Attempted start to lawnmowers, but they won't move and thus won't be one-use
  - Uploaded and loaded some images for the objects in setup

# Wednesday June 5th - Friday June 7th

-Brandon
  - Brainstorming remaining features and solutions to issues (not much success)

# Sunday June 9th

-Brandon
  - Uploaded remaining images by placing pimage as a instance variable rather than only instantiating in setup
  - Created a sunflower class to produce sun and be placed down
  - Adjusted bullet damage, image,  disappearing on impact and making sure that they all don't disappear when something dies
  - Loss screen
  - Created plant menu to select either plant
  - Changed mousepressed to indicate a selected plant with a highlight, instead of a dragged thing
  - Cheat codes to give sun and speed up game
  - Moved zombie spawns back to be delayed
  - Made centering of plants, though it may end up a bit far away due to mathematical errors
  - General touchups, but still buggy
  - Update and finish readme
