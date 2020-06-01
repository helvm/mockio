-- src/Dice.hs
module Dice where

import MockIO
import MockIO.IO

rollDice :: MockIO m => Int -> m Int
rollDice sides = mGetRandomInt 1 sides

rollDiceIO :: Int -> IO Int
rollDiceIO = rollDice
