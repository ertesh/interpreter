module Interpreter where

import Control.Monad.Error
import Control.Monad.State
import Data.Map as M
import Abslang

interpret :: Prog -> IO()
interpret t = do
    putStrLn "OK"

data Value = Vint Int | Vbool Bool | VString String deriving Eq

type Var = String
type MyState = M.Map Var Value
type Program a = ErrorT MyError (State MyState) a


eval :: Exp -> Program Value
eval (EOr e1 e2) = do
    Vbool b1 <- eval e1
    Vbool b2 <- eval e2
    return VBool (e1 or e2)


exec :: Stm -> Program ()
exec (SDecl dec) = return ()

lookup :: Var -> Program Value
lookup name = do
    case lookup name 

--update :: Var -> Value -> Program ()


