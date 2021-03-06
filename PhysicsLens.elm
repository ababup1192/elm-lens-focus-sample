module Main exposing (..)

import Html exposing (..)
import Monocle.Lens exposing (Lens, compose, modify)


-- OBJECTS


type alias Object =
    { position : Point
    , velocity : Point
    }


type alias Point =
    { x : Float
    , y : Float
    }


main : Html msg
main =
    text (toString (step 1.5 object))


object : Object
object =
    Object (Point 3 4) (Point 1 1)


step : Float -> Object -> Object
step dt object =
    object
        |> modify (position => x) (\px -> px + object.velocity.x * dt)
        |> modify (position => y) (\px -> px + object.velocity.x * dt)


(=>) : Lens a b -> Lens b c -> Lens a c
(=>) =
    compose
infixr 9 =>


x : Lens { r | x : a } a
x =
    Lens .x (\x r -> { r | x = x })



y : Lens { r | y : a } a
y =
    Lens .y (\y r -> { r | y = y })


position : Lens { r | position : a } a
position =
    Lens .position (\position r -> { r | position = position })


velocity : Lens { r | velocity : a } a
velocity =
    Lens .velocity (\velocity r -> { r | velocity = velocity })
