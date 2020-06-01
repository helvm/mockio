module HelloSpec where

import Test.Hspec (Spec, describe, it, shouldBe)

import Hello
import MockIO
import MockIO.Simple


spec :: Spec
spec = do
  describe "Asking Questions" $ do
    it "asks your name" $ do
      let env = MockState [] [] []
      let (_, st) = runMockIO (askQuestion "your name") env
      st `shouldBe` MockState [] ["What is your name? "] []

    it "asks your age" $ do
      let env = MockState [] [] []
      let (_, st) = runMockIO (askQuestion "your name") env
      st `shouldBe` MockState [] ["What is your name? "] []

  describe "Answering" $ do
    it "answers with a name" $ do
      let env = MockState ["Joe"] [] []
      let (res, _) = runMockIO getAnswer env
      res `shouldBe` "Joe"

  describe "Hello" $ do
    it "asks and says hello" $ do
      let env = MockState ["Joe"] [] []
      let res = runMockIO hello env
      res `shouldBe` ("Hello Joe!", MockState [] ["What is your name? "] [])

