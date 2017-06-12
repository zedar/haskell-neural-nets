module Learning where

import Types

learning :: Neuron -> Int -> Int -> Neuron
learning n (-1) _ = n -- stop here
learning n i maxIter = learning n1 loop maxIter where
    n1 = setNeuronOutput n (output n + fromIntegral i * 2.0)
    loop  | i == -1 = -1
          | i == maxIter - 1 = -1
          | otherwise = i+1


