# to-elm-format-string
A quick way to see the model as your programs run.

Just add the line:
Html.pre [][ model |> toElmFormatString |> text ]

to the bottom of your view function and you'll never wonder what the value of your model is again.
