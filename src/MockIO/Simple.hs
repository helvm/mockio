-- src/MockIO/Simple.hs
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}

module MockIO.Simple where

import Control.Monad.State
import MockIO

-- | MockState is a data structure used for simple mocking of IO
-- This data type contains intput, and output strings to simulate stdin and stdout
-- as well as a list of integers for a random number generator.
data MockState = MockState
  { outputs :: [String] -- getLine
  , inputs :: [String]  -- putStr(Ln)
  , outputInts :: [Int] -- mGetRandomInt
  }
  deriving (Show, Eq)

-- |SimpleMockedIO is the data type that simulates the runtime environment
-- See runMockIO for details on simulating IO
type SimpleMockedIO = State MockState

-- |runMockIO simulates IO returning the state after execution
runMockIO :: SimpleMockedIO a -> MockState -> (a, MockState)
runMockIO = runState

-- |Instance example of MockIO for simulation
-- Defines access to inputs, outputs and random numbers.
instance MockIO SimpleMockedIO where
  mPutStr str = do
    st <- get
    let newSt = st { inputs = str:inputs st }
    put newSt
    return ()

  mGetLine = do
    st <- get
    case outputs st of
      [] -> error "MOCK ERROR: Empty stdin"
      (o:ox) -> do
         let newSt = st { outputs = ox }
         put newSt
         return o

  mGetRandomInt minVal maxVal = do
    st <- get
    case outputInts st of
      [] -> error "MOCK ERROR: Empty random number generator"
      (i:ix) -> do
        if i < minVal || i > maxVal
         then error "MOCK ERROR: Bad Values in Random Number Generator"
         else do
           let newSt = st { outputInts = ix }
           put newSt
           return i
