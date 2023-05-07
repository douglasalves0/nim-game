module GetDifficulty (getDifficulty) where

import EasyEngine
import MediumEngine
import HardEngine

getDifficulty :: Int -> (([Int])->(Int,Int))
getDifficulty 1 = easyEngine
getDifficulty 2 = mediumEngine
getDifficulty 3 = hardEngine
