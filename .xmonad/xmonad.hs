--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
 
import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Input
import System.Exit
import System.IO

import System.Time
import System.Locale

import XMonad.Hooks.ManageDocks (ToggleStruts(..), avoidStruts)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

currentTimeString :: IO (String)
currentTimeString = do
                    t <- getClockTime
                    ct <- toCalendarTime t
                    return $ formatCalendarTime defaultTimeLocale "%Y/%m/%d-%H:%M:%S" ct

logMessage :: String -> X ()
logMessage s = io $ do
                    timeString <- currentTimeString
                    appendFile "/home/jjthrash/.log" (timeString ++ ": " ++ s ++ "\n")

logPrompt :: X ()
logPrompt = inputPrompt defaultXPConfig "Log" ?+ logMessage

appendTodo :: String -> X ()
appendTodo s = io $ appendFile "/home/jjthrash/.todo" (s ++ "\n")

todoPrompt :: X ()
todoPrompt = inputPrompt defaultXPConfig "TODO" ?+ appendTodo

displayTodo :: X ()
displayTodo = spawn "xmessage -file /home/jjthrash/.todo"

myKeys conf@(XConfig {XMonad.modMask = modMask}) = mkKeymap conf
    [ ("M-f", sendMessage ToggleStruts)
    , ("M-S-l", logPrompt)
    , ("M-S-a", todoPrompt)
    , ("M-S-t", displayTodo) ]

myLayout = avoidStruts (tiled ||| Mirror tiled ||| noBorders Full)
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100


-- prompt :: X string -> X string
-- prompt = 

main = xmonad gnomeConfig
            { modMask    = mod4Mask
            --, terminal   = "gnome"
            , keys       = \c -> M.union (myKeys c) (keys gnomeConfig c)
            , layoutHook = myLayout
            }
