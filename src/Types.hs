module Types where

-- data accessors: https://en.wikibooks.org/wiki/Haskell/More_on_datatypes

data ActivationFunc = SIGMOID | LINEAR deriving (Enum, Show)

data Neuron = Neuron {
  output :: Double,
  ins :: [Link],
  actfunc :: ActivationFunc
} deriving (Show)

setOutput :: Neuron -> Double -> Neuron
setOutput n out = n {output = out}

data Link = Link {
  weight :: Double,
  nin :: Neuron
} deriving (Show)

data Network = Network {
  lin :: [Neuron],
  lhidden :: [Neuron],
  lout :: [Neuron]
} deriving (Show)


