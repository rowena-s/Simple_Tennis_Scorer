# Simple Tennis Scorer

This is a ruby program to run a scoreboard for a single set match of tennis.
It is a work in progress and currently doesn't handle tie-breaks.

## Running The Program
This program is only runnable from the irb.
Assuming you've run irb in a shell from the project root directory.

```
>> require './match.rb'
>> match=Match.new("player1",player2)
#indicates player 1 won a point
>> match.pointWonBy("player1")
#prints the score in format <games>, <points>  
>> match.score
```

## Testing
Some tests are included in the spec directory.
They can be run with the rspec command from the project root.