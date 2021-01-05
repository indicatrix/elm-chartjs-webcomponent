module Chartjs.DataSets.Bubble exposing
    ( DataSet, Datum, defaultBubbleFromLabel, defaultBubbleFromData
    , setData, setXAxisID, setYAxisID, setBackgroundColor, setBorderColor, setBorderWidth
    , setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth
    , setHoverRadius, setPointStyle, setRadius
    )

{-| A bubble chart provides a way of showing data values represented as vertical bubbles.

@docs DataSet, Datum, defaultBubbleFromLabel, defaultBubbleFromData
@docs setData, setXAxisID, setYAxisID, setBackgroundColor, setBorderColor, setBorderWidth
@docs setHoverBackgroundColor, setHoverBorderColor, setHoverBorderWidth

-}

import Chartjs.Common as Common
import Color exposing (Color)


{-| For further information on these properties, see <https://www.chartjs.org/docs/latest/charts/bubble.html>

You should not use the dataset type directly
Instead use the updater pipeline functions:

    defaultBubbleFromLabel "Example"
        |> setBackgroundColor (Common.All Color.red)
        |> setBorderColor (Common.All Color.white)

-}
type alias DataSet =
    { label : String
    , data : List Datum
    , xAxisID : Maybe String
    , yAxisID : Maybe String
    , backgroundColor : Maybe (Common.PointProperty Color)
    , borderColor : Maybe (Common.PointProperty Color)
    , borderWidth : Maybe (Common.PointProperty Float)
    , hoverBackgroundColor : Maybe (Common.PointProperty Color)
    , hoverBorderColor : Maybe (Common.PointProperty Color)
    , hoverBorderWidth : Maybe (Common.PointProperty Float)
    , hoverRadius : Maybe (Common.PointProperty Float)
    , pointStyle : Maybe (Common.PointProperty Common.PointStyle)
    , radius : Maybe (Common.PointProperty Float)
    }


{-| Bubble chart datasets need to contain a data array of points, each points represented by an object containing the following properties:

**Important:** the radius property, r is not scaled by the chart, it is the raw radius in pixels of the bubble that is drawn on the canvas.

-}
type alias Datum =
    { x : Float
    , y : Float
    , r : Float
    }


{-| Create a Bubble dataset with just a label
-}
defaultBubbleFromLabel : String -> DataSet
defaultBubbleFromLabel label =
    defaultBubbleFromData label []


{-| Create a Bubble dataset with a label and data
-}
defaultBubbleFromData : String -> List Datum -> DataSet
defaultBubbleFromData label data =
    { label = label
    , data = data
    , xAxisID = Nothing
    , yAxisID = Nothing
    , backgroundColor = Nothing
    , borderColor = Nothing
    , borderWidth = Nothing
    , hoverBackgroundColor = Nothing
    , hoverBorderColor = Nothing
    , hoverBorderWidth = Nothing
    , hoverRadius = Nothing
    , pointStyle = Nothing
    , radius = Nothing
    }


{-| Set the data displayed by this dataset
This is a list of floats, where each float is represented as a bubble
-}
setData : List Datum -> DataSet -> DataSet
setData data dataset =
    { dataset | data = data }


{-| The ID of the X axis to plot the dataset on
-}
setXAxisID : String -> DataSet -> DataSet
setXAxisID id dataset =
    { dataset | xAxisID = Just id }


{-| The ID of the Y axis to plot the dataset on
-}
setYAxisID : String -> DataSet -> DataSet
setYAxisID id dataset =
    { dataset | yAxisID = Just id }


{-| Fill color of the bar
-}
setBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setBackgroundColor color dataset =
    { dataset | backgroundColor = Just color }


{-| Border color of the bar
-}
setBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setBorderColor color dataset =
    { dataset | borderColor = Just color }


{-| Stroke width of the bar in pixels
-}
setBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setBorderWidth width dataset =
    { dataset | borderWidth = Just width }


{-| Fill color of the bar when hovered
-}
setHoverBackgroundColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBackgroundColor color dataset =
    { dataset | hoverBackgroundColor = Just color }


{-| Border color of the bar when hovered
-}
setHoverBorderColor : Common.PointProperty Color -> DataSet -> DataSet
setHoverBorderColor color dataset =
    { dataset | hoverBorderColor = Just color }


{-| Border width of the bar when hovered
-}
setHoverBorderWidth : Common.PointProperty Float -> DataSet -> DataSet
setHoverBorderWidth width dataset =
    { dataset | hoverBorderWidth = Just width }


{-| bubble additional radius when hovered (in pixels)
-}
setHoverRadius : Common.PointProperty Float -> DataSet -> DataSet
setHoverRadius r dataset =
    { dataset | hoverRadius = Just r }


{-| bubble shape style

'circle'
'cross'
'crossRot'
'dash'
'line'
'rect'
'rectRounded'
'rectRot'
'star'
'triangle'

-}
setPointStyle : Common.PointProperty Common.PointStyle -> DataSet -> DataSet
setPointStyle pointStyle dataset =
    { dataset | pointStyle = Just pointStyle }


{-| bubble radius (in pixels)
-}
setRadius : Common.PointProperty Float -> DataSet -> DataSet
setRadius r dataset =
    { dataset | radius = Just r }
