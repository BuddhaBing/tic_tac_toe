# Tic Tac Toe Tech Test

[![Build Status](https://travis-ci.org/treborb/tic_tac_toe.svg?branch=master)](https://travis-ci.org/treborb/tic_tac_toe)
[![codecov](https://codecov.io/gh/treborb/tic_tac_toe/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/tic_tac_toe)

#### Ruby v2.3.3
### [Makers Academy] (http://www.makersacademy.com) - Week 10 Solo Practice Tech Test

## Index
* [Installation] (#Install)
* [Rspec Tests] (#Rspec)
* [Usage] (#Usage)

## The brief

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

## <a id="Install">Installation</a>
```
$ git clone https://github.com/treborb/tic_tac_toe.git
$ cd tic_tac_toe
$ rvm 2.3.3
$ gem install bundler
$ bundle
```
## <a id="Usage">Usage</a>

### The board
 0 | 1 | 2
---|---|---
 3 | 4 | 5
 6 | 7 | 8

#### Load up your favourite REPL (e.g. irb)

```
$ irb
```

#### In the REPL
```ruby
$ require "./lib/game"
$ game = Game.new
$ game.turn(n) # where n is the number of the square (0-8)
```

## <a id="Rspec">Running the tests</a>
```ruby
$ rspec
```
