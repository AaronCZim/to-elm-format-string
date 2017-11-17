module ToElmFormatString exposing (toElmFormatString)

{-| A quick way to display the current model in a readable way.
By adding the line 'Html.pre [][ model |> toElmFormatString |> Html.text ]'
to your code, you can see exactly what's going on in your program at any time.

@docs toElmFormatString

-}


{-| Accepts single values, List, and Records of any depth
and inserts newlines with tabulation according to the elm formatting rules.
-}
toElmFormatString : model -> String
toElmFormatString model =
    model
        |> toString
        |> String.foldr foldRecord ( -4, "" )
        |> foldRecordFinish


foldRecord chr ( indentCnt, str ) =
    if chr == ',' then
        ( indentCnt
        , String.cons '\n' (indent (String.cons chr (String.cons ' ' str)) indentCnt)
        )
    else if chr == '{' || chr == '[' || chr == '(' then
        ( indentCnt - 4
        , String.cons '\n' (indent (String.cons chr (String.cons ' ' str)) indentCnt)
        )
    else if chr == '}' || chr == ']' || chr == ')' then
        ( indentCnt + 4
        , String.cons '\n' (indent (String.cons chr (String.cons ' ' str)) (indentCnt + 4))
        )
    else
        ( indentCnt, String.cons chr str )


indent str cnt =
    if cnt <= 0 then
        str
    else
        indent (String.cons ' ' str) (cnt - 1)


foldRecordFinish ( indentCnt, str ) =
    str
