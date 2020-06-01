module DiceSpec where

import Test.Hspec (Spec, describe, it, shouldBe)

import Dice (rollDice)
import MockIO
import MockIO.Simple

spec :: Spec
spec = do
  describe "Rolling Dice" $ do
    it "Rolls all numbers between 1 and 6" $ do
      let env = MockState [] [] [1,2,3,4,5,6]
      let test :: MockIO m => m [Int]
          test = do
            r1 <- rollDice 6
            r2 <- rollDice 6
            r3 <- rollDice 6
            r4 <- rollDice 6
            r5 <- rollDice 6
            r6 <- rollDice 6
            return [r1, r2, r3, r4, r5, r6]
      let (res,_) = runMockIO test env
      res `shouldBe` [1,2,3,4,5,6]
