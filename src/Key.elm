module Key exposing (..)


type Key
    = A
    | B
    | Backslash
    | Backspace
    | C
    | CapsLock
    | CloseBracket
    | Comma
    | D
    | E
    | Eight
    | Enter
    | Equals
    | F
    | Five
    | Four
    | Function
    | G
    | H
    | I
    | J
    | K
    | L
    | LeftAlt
    | LeftControl
    | LeftShift
    | M
    | Minus
    | N
    | Nine
    | O
    | One
    | OpenBracket
    | P
    | Period
    | PrintScreen
    | Q
    | Quote
    | R
    | RightAlt
    | RightControl
    | RightShift
    | S
    | Semicolon
    | Seven
    | Six
    | Slash
    | SpaceBar
    | T
    | Tab
    | Three
    | Tilde
    | Two
    | U
    | V
    | W
    | WindowsLogo
    | X
    | Y
    | Z
    | Zero


isVowel : Key -> Bool
isVowel key =
    case key of
        A ->
            True

        B ->
            False

        Backslash ->
            False

        Backspace ->
            False

        C ->
            False

        CapsLock ->
            False

        CloseBracket ->
            False

        Comma ->
            False

        D ->
            False

        E ->
            True

        Eight ->
            False

        Enter ->
            False

        Equals ->
            False

        F ->
            False

        Five ->
            False

        Four ->
            False

        Function ->
            False

        G ->
            False

        H ->
            False

        I ->
            True

        J ->
            False

        K ->
            False

        L ->
            False

        LeftAlt ->
            False

        LeftControl ->
            False

        LeftShift ->
            False

        M ->
            False

        Minus ->
            False

        N ->
            False

        Nine ->
            False

        O ->
            True

        One ->
            False

        OpenBracket ->
            False

        P ->
            False

        Period ->
            False

        PrintScreen ->
            False

        Q ->
            False

        Quote ->
            False

        R ->
            False

        RightAlt ->
            False

        RightControl ->
            False

        RightShift ->
            False

        S ->
            False

        Semicolon ->
            False

        Seven ->
            False

        Six ->
            False

        Slash ->
            False

        SpaceBar ->
            False

        T ->
            False

        Tab ->
            False

        Three ->
            False

        Tilde ->
            False

        Two ->
            False

        U ->
            True

        V ->
            False

        W ->
            False

        WindowsLogo ->
            False

        X ->
            False

        Y ->
            True

        Z ->
            False

        Zero ->
            False


isLetter : Key -> Bool
isLetter key =
    case key of
        A ->
            True

        B ->
            True

        Backslash ->
            False

        Backspace ->
            False

        C ->
            True

        CapsLock ->
            False

        CloseBracket ->
            False

        Comma ->
            False

        D ->
            True

        E ->
            True

        Eight ->
            False

        Enter ->
            False

        Equals ->
            False

        F ->
            True

        Five ->
            False

        Four ->
            False

        Function ->
            False

        G ->
            True

        H ->
            True

        I ->
            True

        J ->
            True

        K ->
            True

        L ->
            True

        LeftAlt ->
            False

        LeftControl ->
            False

        LeftShift ->
            False

        M ->
            True

        Minus ->
            False

        N ->
            True

        Nine ->
            False

        O ->
            True

        One ->
            False

        OpenBracket ->
            False

        P ->
            True

        Period ->
            False

        PrintScreen ->
            False

        Q ->
            True

        Quote ->
            False

        R ->
            True

        RightAlt ->
            False

        RightControl ->
            False

        RightShift ->
            False

        S ->
            True

        Semicolon ->
            False

        Seven ->
            False

        Six ->
            False

        Slash ->
            False

        SpaceBar ->
            False

        T ->
            True

        Tab ->
            False

        Three ->
            False

        Tilde ->
            False

        Two ->
            False

        U ->
            True

        V ->
            True

        W ->
            True

        WindowsLogo ->
            False

        X ->
            True

        Y ->
            True

        Z ->
            True

        Zero ->
            False


isNumber : Key -> Bool
isNumber key =
    case key of
        A ->
            False

        B ->
            False

        Backslash ->
            False

        Backspace ->
            False

        C ->
            False

        CapsLock ->
            False

        CloseBracket ->
            False

        Comma ->
            False

        D ->
            False

        E ->
            False

        Eight ->
            True

        Enter ->
            False

        Equals ->
            False

        F ->
            False

        Five ->
            True

        Four ->
            True

        Function ->
            False

        G ->
            False

        H ->
            False

        I ->
            False

        J ->
            False

        K ->
            False

        L ->
            False

        LeftAlt ->
            False

        LeftControl ->
            False

        LeftShift ->
            False

        M ->
            False

        Minus ->
            False

        N ->
            False

        Nine ->
            True

        O ->
            False

        One ->
            True

        OpenBracket ->
            False

        P ->
            False

        Period ->
            False

        PrintScreen ->
            False

        Q ->
            False

        Quote ->
            False

        R ->
            False

        RightAlt ->
            False

        RightControl ->
            False

        RightShift ->
            False

        S ->
            False

        Semicolon ->
            False

        Seven ->
            True

        Six ->
            True

        Slash ->
            False

        SpaceBar ->
            False

        T ->
            False

        Tab ->
            False

        Three ->
            True

        Tilde ->
            False

        Two ->
            True

        U ->
            False

        V ->
            False

        W ->
            False

        WindowsLogo ->
            False

        X ->
            False

        Y ->
            False

        Z ->
            False

        Zero ->
            True


isPunctuation : Key -> Bool
isPunctuation key =
    case key of
        A ->
            False

        B ->
            False

        Backslash ->
            True

        Backspace ->
            False

        C ->
            False

        CapsLock ->
            False

        CloseBracket ->
            True

        Comma ->
            True

        D ->
            False

        E ->
            False

        Eight ->
            False

        Enter ->
            False

        Equals ->
            True

        F ->
            False

        Five ->
            False

        Four ->
            False

        Function ->
            False

        G ->
            False

        H ->
            False

        I ->
            False

        J ->
            False

        K ->
            False

        L ->
            False

        LeftAlt ->
            False

        LeftControl ->
            False

        LeftShift ->
            False

        M ->
            False

        Minus ->
            True

        N ->
            False

        Nine ->
            False

        O ->
            False

        One ->
            False

        OpenBracket ->
            True

        P ->
            False

        Period ->
            True

        PrintScreen ->
            False

        Q ->
            False

        Quote ->
            True

        R ->
            False

        RightAlt ->
            False

        RightControl ->
            False

        RightShift ->
            False

        S ->
            False

        Semicolon ->
            True

        Seven ->
            False

        Six ->
            False

        Slash ->
            True

        SpaceBar ->
            False

        T ->
            False

        Tab ->
            False

        Three ->
            False

        Tilde ->
            True

        Two ->
            False

        U ->
            False

        V ->
            False

        W ->
            False

        WindowsLogo ->
            False

        X ->
            False

        Y ->
            False

        Z ->
            False

        Zero ->
            False


isConsonant : Key -> Bool
isConsonant key =
    isLetter key && not (isVowel key)


isSpecial : Key -> Bool
isSpecial key =
    not (isLetter key) && not (isPunctuation key) && not (isNumber key)


toString : Key -> String
toString key =
    case key of
        A ->
            "A"

        B ->
            "B"

        Backslash ->
            "\\"

        Backspace ->
            "Backspace"

        C ->
            "C"

        CapsLock ->
            "CapsLock"

        CloseBracket ->
            "]"

        Comma ->
            ","

        D ->
            "D"

        E ->
            "E"

        Eight ->
            "8"

        Enter ->
            "Enter"

        Equals ->
            "="

        F ->
            "F"

        Five ->
            "5"

        Four ->
            "4"

        Function ->
            "Fn"

        G ->
            "G"

        H ->
            "H"

        I ->
            "I"

        J ->
            "J"

        K ->
            "K"

        L ->
            "L"

        LeftAlt ->
            "Alt"

        LeftControl ->
            "Ctrl"

        LeftShift ->
            "Shift"

        M ->
            "M"

        Minus ->
            "-"

        N ->
            "N"

        Nine ->
            "9"

        O ->
            "O"

        One ->
            "1"

        OpenBracket ->
            "["

        P ->
            "P"

        Period ->
            "."

        PrintScreen ->
            "PrtSc"

        Q ->
            "Q"

        Quote ->
            "'"

        R ->
            "R"

        RightAlt ->
            "Alt"

        RightControl ->
            "Ctrl"

        RightShift ->
            "Shift"

        S ->
            "S"

        Semicolon ->
            ";"

        Seven ->
            "7"

        Six ->
            "6"

        Slash ->
            "/"

        SpaceBar ->
            ""

        T ->
            "T"

        Tab ->
            "Tab"

        Three ->
            "3"

        Tilde ->
            "~"

        Two ->
            "2"

        U ->
            "U"

        V ->
            "V"

        W ->
            "W"

        WindowsLogo ->
            "WIN"

        X ->
            "X"

        Y ->
            "Y"

        Z ->
            "Z"

        Zero ->
            "0"


isInString : String -> Key -> Bool
isInString string key =
    not (isSpecial key) && String.contains (toString key) (String.toUpper string)
