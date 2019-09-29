module Main exposing (Forecast(..), PointEstimate, RangedEstimate, Round, Series, exampleRound, main, myElement, myRowOfStuff, row2)

import Date
import Duration as Duration
import Element exposing (Element, alignRight, centerY, column, el, fill, padding, paragraph, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout [] <|
        column [ width fill, spacing 30 ]
            [ myRowOfStuff
            , row2
            ]
            {-
-- # Contrasting vocations
-- Weather forecaster
-- TV pundit
-- High-frequency trader
-- Politician
-- Firefighter
-- SEO engineer

-- Is "rapid feedback" the right angle to attack this from?
-- Maybe "any quantifiable feedback" is better...

-- If you were to rank those professions by how accurately they can predict outcomes, you may see a distinction;
-- some

-}

row2 : Element msg
row2 =
    row [ width fill, spacing 30 ]
        [ paragraph [] [ text "So, what is a Brier Score?" ]
        , paragraph [] [ text "Well, let's start with the problem. " ]


        ]


myRowOfStuff : Element msg
myRowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , myElement
        , el [ alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 30
        ]
        (text "stylish!")


type alias RangedEstimate =
    { lowerBound : Duration.Duration
    , upperBound : Duration.Duration
    , confidence : Float
    , madeOn : Date.Date
    }


type alias PointEstimate =
    { point : Duration.Duration
    , confidence : Float
    , madeOn : Date.Date
    }


type Forecast
    = Ranged RangedEstimate
    | Point PointEstimate


type alias Series =
    { forecaster : String
    , forecasts : List Forecast
    }


type alias Round =
    { defaultForecast : Forecast
    , forecasts : List Series
    , outcome : Maybe Duration.Duration
    }


exampleRound : Round
exampleRound =
    { defaultForecast = Point { point = Duration.hours 3, confidence = 0.8, madeOn = Date.fromRataDie 12345 }
    , forecasts = []
    , outcome = Nothing
    }
