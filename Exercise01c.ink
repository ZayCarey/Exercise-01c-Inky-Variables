/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/
VAR health = 5
VAR pet_name = ""
VAR torches = 0

-> memory

== memory ==
Before you stands the cavern of secrets. You wish your childhood pet was with you. The cave might be less intimidating then. What was your pets name?
* Charlie
~ pet_name="Charlie"
-> cave_mouth
* Susan
~ pet_name="Susan"
-> cave_mouth
* Spot
~ pet_name="Spot"
-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
you've made it to the cave. If only {pet_name} could see you now!
you have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
+ [Take the north tunnel] -> north_tunnel
+ [Take the south tunnel] -> south_tunnel
* [Pick up the torch] -> torch_pickup

== north_tunnel ==
You are in the north.
* {torches > 0} [Light Torch] -> north_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== south_tunnel ==
You are in the south tunnel.
+ [Go Back]-> cave_mouth

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches+1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
* {not coin_pickup} [Pick up coins] -> coin_pickup

== west_tunnel_lit ==
The light of your torch show a little monster called a goblin.
* -> goblin

== north_tunnel_lit ==
The light of your torch leads you to the end of the cave.
+ -> cave_end

== coin_pickup ==
After picking up the coins you activate a trap -> booby_trap

==goblin==
The goblin notices you and kills you.
-> END

== booby_trap ==
You Die
-> END
==cave_end==
Do you leave
+ [Yes]->Leave
+[Go Back]-> cave_mouth
==Leave==
You have left the cave.
->END