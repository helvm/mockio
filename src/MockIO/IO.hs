-- src/MockIO/IO.hs
module MockIO.IO where

import System.Random
import MockIO

-- |Instance of MockIO for runtime execution with IO
instance MockIO IO where
  mPutStr = Prelude.putStr
  mPutStrLn = Prelude.putStrLn
  mGetLine = Prelude.getLine
  mGetRandomInt minVal maxVal = getStdRandom (randomR (minVal, maxVal))

