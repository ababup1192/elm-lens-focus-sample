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



-- DO STUFF


main : Html msg
main =
    text (toString (step 1.5 object))


object : Object
object =
    Object (Point 3 4) (Point 1 1)


step : Float -> Object -> Object
step dt object =
    object
        |> modify (compose position pointX) (\px -> px + object.velocity.x * dt)
        >> modify (compose position pointY) (\px -> px + object.velocity.x * dt)


pointX : Lens Point Float
pointX =
    let
        get point =
            point.x

        set x point =
            { point | x = x }
    in
        Lens get set


pointY : Lens Point Float
pointY =
    let
        get point =
            point.y

        set y point =
            { point | y = y }
    in
        Lens get set


position : Lens Object Point
position =
    let
        get object =
            object.position

        set position object =
            { object | position = position }
    in
        Lens get set


velocity : Lens Object Point
velocity =
    let
        get object =
            object.velocity

        set velocity object =
            { object | velocity = velocity }
    in
        Lens get set
