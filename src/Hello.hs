module Hello where

import MockIO

askQuestion :: MockIO m => String -> m ()
askQuestion q = mPutStr $ "What is " ++ q ++ "? "

getAnswer :: MockIO m => m String
getAnswer = mGetLine

hello :: MockIO m => m String
hello = do
  askQuestion "your name"
  answer <- getAnswer
  return $ "Hello " ++ answer ++ "!"
