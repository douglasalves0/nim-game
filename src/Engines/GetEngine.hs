module Engines.GetEngine (getEngine) where

import Engines.EasyEngine
import Engines.HardEngine
import Engines.MediumEngine

getEngine :: Int -> (([Int])->(Int,Int))
getEngine 0 = easyEngine
getEngine 1 = mediumEngine
getEngine 2 = hardEngine
