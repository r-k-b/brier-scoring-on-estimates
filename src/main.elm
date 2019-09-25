import Element exposing (Element, el, text, row, alignRight, fill, width, rgb255, spacing, centerY, padding)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Duration as Duration
import Date

main =
    Element.layout []
        myRowOfStuff

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
    { lowerBound: Duration.Duration
    , upperBound: Duration.Duration
    , confidence: Float
    , madeOn: Date.Date}

type alias PointEstimate =
    { point: Duration.Duration
    , confidence: Float
    , madeOn: Date.Date }

type Forecast = Ranged RangedEstimate | Point PointEstimate

type alias Series =
    { forecaster: String
    , forecasts: List Forecast
    }

type alias Round =
    { defaultForecast: Forecast
    , forecasts: List Series
    , outcome: Maybe Duration.Duration
    }

exampleRound: Round
exampleRound =
    { defaultForecast = Point {point= Duration.hours 3, confidence = 0.8, madeOn = Date.fromRataDie 12345 }
    , forecasts = []
    , outcome = Nothing
    }
