module Demo exposing (main)

import Html exposing (..)
import ToElmFormatString exposing (toElmFormatString)


main =
    div []
        [ h3 [] [ text "Single Values are Identical to toSting" ]
        , ul []
            [ li [] [ 10 |> toElmFormatString |> text ]
            , li [] [ "string" |> toElmFormatString |> text ]
            ]
        , h3 []
            [ text "Lists and Records get newlines and tabulation added like the would with elm-format." ]
        , pre [] [ [ "one", "two", "three" ] |> toElmFormatString |> text ]
        , h3 [] [ text "Lists and Rectords can have any depth." ]
        , pre []
            [ [ [ ( 1, 1 ), ( 1, 2 ), ( 1, 3 ) ]
              , [ ( 2, 1 ), ( 2, 2 ), ( 2, 3 ) ]
              , [ ( 3, 1 ), ( 3, 2 ), ( 3, 3 ) ]
              ]
                |> toElmFormatString
                |> text
            ]
        , hr [] []
        , pre []
            [ { one = 1
              , two =
                    [ [ ( 1, 1 ), ( 1, 2 ), ( 1, 3 ) ]
                    , [ ( 2, 1 ), ( 2, 2 ), ( 2, 3 ) ]
                    , [ ( 3, 1 ), ( 3, 2 ), ( 3, 3 ) ]
                    ]
              , three = { one = 1, two = 2, three = 3 }
              }
                |> toElmFormatString
                |> text
            ]
        ]
