module Lib
    ( makeDeck
    , shuffle
    ) where

import System.Random
import qualified Data.Map as Map

data Suit = Spades | Hearts | Clubs | Diamonds deriving (Enum)
data Value = Two | Three | Four | Five | Six | Seven | Eight | Nine
  | Ten | J | Q | K | A  deriving (Enum)

instance Show Value where
  show Two = "2"
  show Three = "3"
  show Four = "4"
  show Five = "5"
  show Six = "6"
  show Seven = "7"
  show Eight = "8"
  show Nine = "9"
  show Ten = "10"
  show J = "J"
  show Q = "Q"
  show K = "K"
  show A = "A"

instance Show Suit where
  show Spades = "♤"
  show Hearts = "♡"
  show Clubs = "♢"
  show Diamonds = "♧"

type Card = (Value, Suit)
type Hand = [Card]
type Deck = [Card]

makeDeck :: Deck
makeDeck = [(value, suit) | suit <- [Spades .. Diamonds], value <- [Two .. A]]

deal :: Deck -> Int -> Int -> [Hand]
deal _ 0 _ = fail "Cannot deal 0 hands"
deal x y z = [x]

shuffle :: RandomGen g => g -> Deck -> Deck
shuffle gen deck = fst $ fisherYates gen deck

fisherYates :: RandomGen g => g -> [a] -> ([a], g)
fisherYates gen [] = ([], gen)
fisherYates gen l =
  toElems $ foldl fisherYatesStep (initial (head l) gen) (numerate (tail l))
  where
    toElems (x, y) = (Map.elems x, y)
    numerate = zip [1..]
    initial x gen = (Map.singleton 0 x, gen)

fisherYatesStep :: RandomGen g => (Map.Map Int a, g) -> (Int, a) -> (Map.Map Int a, g)
fisherYatesStep (m, gen) (i, x) = ((Map.insert j x . Map.insert i (m Map.! j)) m, gen')
  where
    (j, gen') = randomR (0, i) gen
