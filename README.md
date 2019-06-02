# MKS22X-FinalProject_PvZ
- Plants v. Zombies
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
