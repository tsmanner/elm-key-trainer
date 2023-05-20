module Layout exposing (Layout, lenovo)

import Key exposing (Key)


type alias Layout =
    { keys : List (List Key)
    , widthFactor : Key -> Float
    }

lenovo : Layout
lenovo =
    { keys =
        [ [ Key.Tilde
          , Key.One
          , Key.Two
          , Key.Three
          , Key.Four
          , Key.Five
          , Key.Six
          , Key.Seven
          , Key.Eight
          , Key.Nine
          , Key.Zero
          , Key.Minus
          , Key.Equals
          , Key.Backspace
          ]
        , [ Key.Tab
          , Key.Q
          , Key.W
          , Key.E
          , Key.R
          , Key.T
          , Key.Y
          , Key.U
          , Key.I
          , Key.O
          , Key.P
          , Key.OpenBracket
          , Key.CloseBracket
          , Key.Backslash
          ]
        , [ Key.CapsLock
          , Key.A
          , Key.S
          , Key.D
          , Key.F
          , Key.G
          , Key.H
          , Key.J
          , Key.K
          , Key.L
          , Key.Semicolon
          , Key.Quote
          , Key.Enter
          ]
        , [ Key.LeftShift
          , Key.Z
          , Key.X
          , Key.C
          , Key.V
          , Key.B
          , Key.N
          , Key.M
          , Key.Comma
          , Key.Period
          , Key.Slash
          , Key.RightShift
          ]
        , [ Key.Function
          , Key.LeftControl
          , Key.WindowsLogo
          , Key.LeftAlt
          , Key.SpaceBar
          , Key.RightAlt
          , Key.PrintScreen
          , Key.RightControl
          ]
        ]

    , widthFactor = \key ->
        case key of
            Key.Tilde ->
                1.0

            Key.One ->
                1.0

            Key.Two ->
                1.0

            Key.Three ->
                1.0

            Key.Four ->
                1.0

            Key.Five ->
                1.0

            Key.Six ->
                1.0

            Key.Seven ->
                1.0

            Key.Eight ->
                1.0

            Key.Nine ->
                1.0

            Key.Zero ->
                1.0

            Key.Minus ->
                1.0

            Key.Equals ->
                1.0

            Key.Backspace ->
                2.0

            Key.Tab ->
                1.5

            Key.Q ->
                1.0

            Key.W ->
                1.0

            Key.E ->
                1.0

            Key.R ->
                1.0

            Key.T ->
                1.0

            Key.Y ->
                1.0

            Key.U ->
                1.0

            Key.I ->
                1.0

            Key.O ->
                1.0

            Key.P ->
                1.0

            Key.OpenBracket ->
                1.0

            Key.CloseBracket ->
                1.0

            Key.Backslash ->
                1.5

            Key.CapsLock ->
                1.73

            Key.A ->
                1.0

            Key.S ->
                1.0

            Key.D ->
                1.0

            Key.F ->
                1.0

            Key.G ->
                1.0

            Key.H ->
                1.0

            Key.J ->
                1.0

            Key.K ->
                1.0

            Key.L ->
                1.0

            Key.Semicolon ->
                1.0

            Key.Quote ->
                1.0

            Key.Enter ->
                2.25

            Key.LeftShift ->
                2.2

            Key.Z ->
                1.0

            Key.X ->
                1.0

            Key.C ->
                1.0

            Key.V ->
                1.0

            Key.B ->
                1.0

            Key.N ->
                1.0

            Key.M ->
                1.0

            Key.Comma ->
                1.0

            Key.Period ->
                1.0

            Key.Slash ->
                1.0

            Key.RightShift ->
                2.8

            Key.Function ->
                1.0

            Key.LeftControl ->
                1.2

            Key.WindowsLogo ->
                1.0

            Key.LeftAlt ->
                1.0

            Key.SpaceBar ->
                5.0

            Key.RightAlt ->
                1.0

            Key.PrintScreen ->
                1.0

            Key.RightControl ->
                1.0

    }
