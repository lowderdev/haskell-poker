module Main where

import Lib
import System.Random

main :: IO ()
main = shuffledDeck

newDeck :: IO ()
newDeck = print makeDeck

shuffledDeck :: IO ()
shuffledDeck = do
  gen <- getStdGen
  setStdGen $ snd $ next gen
  print $ shuffle gen makeDeck
