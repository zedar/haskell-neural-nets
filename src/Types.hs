module Types (
    ActivationFunc(..),
    Neuron(..), setNeuronOutput, addLinksToNeuron,
    Link(..),
    Network
  ) where

-- data accessors: https://en.wikibooks.org/wiki/Haskell/More_on_datatypes

data ActivationFunc = SIGMOID | LINEAR deriving (Enum, Show)

{-- |
    Basic neuron
-}
data Neuron = Neuron {
  output :: Double,
  ins :: [Link],
  actfunc :: ActivationFunc
} deriving (Show)

setNeuronOutput :: Neuron -> Double -> Neuron
setNeuronOutput n out = n {output = out}

addLinksToNeuron :: Neuron -> [Neuron] -> Neuron
addLinksToNeuron n ns = n{ins = makeLinks ns}

makeLinks :: [Neuron] -> [Link]
makeLinks = map (\ n -> Link{nin = n, weight = 0.0})

data Link = Link {
  weight :: Double,
  nin :: Neuron
} deriving (Show)

data Network = Network {
  lin :: [Neuron],
  lhidden :: [Neuron],
  lout :: [Neuron]
} deriving (Show)


