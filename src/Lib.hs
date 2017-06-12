{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc
    ) where

import Data.Text
import qualified Data.Text.IO as T
import Types
import Learning

someFunc :: IO ()
someFunc = do
  T.putStrLn "!TEST!"
  -- input layer
  let in1 = Neuron{ output = 0.0, ins = [], actfunc = SIGMOID}
  let in2 = Neuron{ output = 0.0, ins = [], actfunc = SIGMOID}
  -- hidden layer
  let hn1 = addLinksToNeuron Neuron{output=0.0, ins=[], actfunc=SIGMOID} [in1, in2]
  T.putStrLn $ pack $ "HIDDEN N1: " ++ show hn1
  -- create basic neuron
  let n1 = Neuron { output = 0, ins = [], actfunc = SIGMOID }
  T.putStrLn $ pack $ "NEURON1: " ++ show n1
  T.putStrLn $ pack $ "N1 OUT: " ++ show(output n1)
  let n2 = setNeuronOutput n1 1.0
  T.putStrLn $ pack $ "N2 OUT: " ++ show(output n2)
  let n3 = learning n1 0 3
  T.putStrLn $ pack $ "N3 OUT: " ++ show(output n3)
