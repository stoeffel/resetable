module Tests exposing (all)

import Expect
import Fuzz exposing (..)
import Resetable
import Test exposing (..)


all : Test
all =
    describe "Resetable"
        [ fuzz2 int int "the original value should never change." <|
            \original new ->
                Resetable.init original
                    |> Resetable.map (\_ -> new)
                    |> Resetable.reset
                    |> Resetable.value
                    |> Expect.equal original
        , fuzz2 int int "you should never get the original value if you don't reset" <|
            \original new ->
                Resetable.init original
                    |> Resetable.map (\_ -> new)
                    |> Resetable.value
                    |> Expect.equal new
        , fuzz2 int int "reset returns to the initial state" <|
            \original new ->
                Resetable.init original
                    |> Resetable.map (\_ -> new)
                    |> Resetable.reset
                    |> Expect.equal (Resetable.init original)
        ]
