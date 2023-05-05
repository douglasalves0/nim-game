module GetDifficulty (getDifficulty) where

import EasyEngine
import MediumEngine
import HardEngine

getDifficulty :: Int -> (([Int])->(Int,Int))
getDifficulty 0 = easyEngine
getDifficulty 1 = mediumEngine
getDifficulty 2 = hardEngine
