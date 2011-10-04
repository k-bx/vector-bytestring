-- Ensure that readInt and readInteger over lazy ByteStrings are not
-- excessively strict.

module Main (main) where

import Data.Vector.Storable.ByteString.Char8 (pack)
import Data.Vector.Storable.ByteString.Lazy.Char8 (readInt, readInteger)
import Data.Vector.Storable.ByteString.Lazy.Internal (ByteString(..))

main :: IO ()
main = do
  let safe   = Chunk (pack "1z") Empty
  let unsafe = Chunk (pack "2z") undefined
  print . fmap fst . readInt $ safe
  print . fmap fst . readInt $ unsafe
  print . fmap fst . readInteger $ safe
  print . fmap fst . readInteger $ unsafe
