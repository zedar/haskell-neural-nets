{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc
    ) where

import Data.Text
import qualified Data.Text.IO as T
import Types

learning :: Neuron -> Int -> Int -> Neuron
learning n (-1) _ = n -- stop here
learning n i maxIter = learning n1 loop maxIter where
    n1 = setOutput n (output n + fromIntegral i * 2.0)
    loop  | i == -1 = -1
          | i == maxIter - 1 = -1
          | otherwise = i+1


someFunc :: IO ()
someFunc = do
  T.putStrLn "!TEST!"
  -- create basic neuron
  let n1 = Neuron { output = 0, ins = [], actfunc = SIGMOID }
  T.putStrLn $ pack $ "NEURON1: " ++ show n1
  T.putStrLn $ pack $ "N1 OUT: " ++ show(output n1)
  let n2 = setOutput n1 1.0
  T.putStrLn $ pack $ "N2 OUT: " ++ show(output n2)
  let n3 = learning n1 0 3
  T.putStrLn $ pack $ "N3 OUT: " ++ show(output n3)
