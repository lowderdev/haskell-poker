{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_poker (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/bin"
libdir     = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/lib/x86_64-osx-ghc-8.6.3/haskell-poker-0.1.0.0-L03CXlG8KMIC485q12UrVY-haskell-poker-exe"
dynlibdir  = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/lib/x86_64-osx-ghc-8.6.3"
datadir    = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/share/x86_64-osx-ghc-8.6.3/haskell-poker-0.1.0.0"
libexecdir = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/libexec/x86_64-osx-ghc-8.6.3/haskell-poker-0.1.0.0"
sysconfdir = "/Users/logan.lowder/workspace/haskell-practice/haskell-poker/.stack-work/install/x86_64-osx/lts-13.5/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_poker_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_poker_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_poker_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_poker_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_poker_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_poker_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
