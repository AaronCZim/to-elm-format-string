# to-elm-format-string
A quick way to see the model as your programs run. There is only one function, toElmFormatString which turns data into a formatted string with newlines and tabulation so you can easily read your model's value.

Just add the line:
Html.pre [][ model |> toElmFormatString |> text ]

to the end of your view function and you'll never wonder what the value of your model is again.
