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
        >> modify (position => y) (\px -> px + object.velocity.x * dt)


(=>) : Lens a b -> Lens b c -> Lens a c
(=>) =
    compose
infixr 9 =>


x : Lens { r | x : Float } Float
x =
    let
        get point =
            point.x

        set x point =
            { point | x = x }
    in
        Lens get set


y : Lens { r | y : Float } Float
y =
    let
        get point =
            point.y

        set y point =
            { point | y = y }
    in
        Lens get set


position : Lens { r | position : a } a
position =
    let
        get object =
            object.position

        set position object =
            { object | position = position }
    in
        Lens get set


velocity : Lens { r | velocity : a } a
velocity =
    let
        get object =
            object.velocity

        set velocity object =
            { object | velocity = velocity }
    in
        Lens get set
