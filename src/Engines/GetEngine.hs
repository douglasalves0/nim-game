module Engines.GetEngine (getEngine) where

import Engines.EasyEngine
import Engines.HardEngine
import Engines.MediumEngine

getEngine :: Int -> (([Int])->(Int,Int))
getEngine 1 = easyEngine
getEngine 2 = mediumEngine
getEngine 3 = hardEngine
