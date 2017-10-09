module Main exposing (..)

import Html exposing (..)


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
    let
        oldPosition =
            object.position

        newPosition =
            { oldPosition
                | x = oldPosition.x + object.velocity.x * dt
                , y = oldPosition.y + object.velocity.y * dt
            }
    in
        { object
            | position = newPosition
        }
