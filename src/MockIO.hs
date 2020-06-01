-- src/MockIO.hs
module MockIO where

class Monad m => MockIO m where
  mPutStr :: String -> m ()
  mPutStrLn :: String -> m ()
  mGetLine :: m String
  mGetRandomInt :: Int -> Int -> m Int
  mPutStrLn s = mPutStr $ s ++ "\n"
