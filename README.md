[![Build Status](https://travis-ci.org/stoeffel/resetable.svg?branch=master)](https://travis-ci.org/stoeffel/resetable)

Editable
========

> A datastructure that allows you to reset its value to an original value.

```elm
Resetable.init "lea"
    |> Resetable.map String.toUpper
    |> Resetable.value
--> "LEA"

Resetable.init "luke"
    |> Resetable.map String.toUpper
    |> Resetable.reset
    |> Resetable.value
--> "luke"
```


## Installation

`elm-package install stoeffel/resetable`

## Tests

Install packages: `npm install -g elm-test elm-verify-examples`

Execute tests: `./execute-tests`
