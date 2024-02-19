module Resetable exposing (Resetable, init, value, map, update, reset, changed)

{-| Simple datastructure which allows you to reset to it's original value.
It's kinda like `Editable` (<http://package.elm-lang.org/packages/stoeffel/editable/latest>), but simpler and there is no way to override its original value.

@docs Resetable, init, value, map, update, reset, changed

-}


{-| Wraps a type in a Resetable.
You can construct a `Resetable` using `init`.
-}
type Resetable a
    = Resetable { original : a, copy : a }


{-| Creates a Resetable and initializes its value.

    Resetable.init "a"

-}
init : a -> Resetable a
init original =
    Resetable
        { original = original
        , copy = original
        }


{-| Get the current value of a Resetable.

    Resetable.init "a"
        |> Resetable.value
    --> "a"

-}
value : Resetable a -> a
value (Resetable { copy }) =
    copy


{-| Map a resetable value.
This allows you to change the value without loosing its original value.

    Resetable.init "hello"
        |> Resetable.map String.toUpper
        |> Resetable.value
    --> "HELLO"

-}
map : (a -> a) -> Resetable a -> Resetable a
map f (Resetable { original, copy }) =
    Resetable
        { original = original
        , copy = f copy
        }


{-| Update a resetable value.
This allows you to change the value without loosing its original value.

    Resetable.init "hello"
        |> Resetable.update "world"
        |> Resetable.value
    --> "world"

-}
update : a -> Resetable a -> Resetable a
update new (Resetable { original }) =
    Resetable
        { original = original
        , copy = new
        }


{-| Reset a Resetable to its original value.

    Resetable.init "hello"
        |> Resetable.map String.toUpper
        |> Resetable.reset
        |> Resetable.value
    --> "hello"

-}
reset : Resetable a -> Resetable a
reset (Resetable { original }) =
    init original


{-| Check if the value has changed.

    Resetable.init "hello"
        |> Resetable.changed
    --> False

    Resetable.init "hello"
        |> Resetable.update "world"
        |> Resetable.changed
    --> True

-}
changed : Resetable a -> Bool
changed (Resetable { original, copy }) =
    original /= copy
