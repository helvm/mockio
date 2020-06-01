module Main where

import Dice

main :: IO ()
main = do
  r <- rollDiceIO 6
  putStrLn $ "You rolled a " ++ show r
