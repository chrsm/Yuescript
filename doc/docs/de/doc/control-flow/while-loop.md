# While-Schleife

Die `while`-Schleife gibt es ebenfalls in vier Variationen:

```yuescript
i = 10
while i > 0
  print i
  i -= 1

while running == true do my_function!
```

<YueDisplay>

```yue
i = 10
while i > 0
  print i
  i -= 1

while running == true do my_function!
```

</YueDisplay>

```yuescript
i = 10
until i == 0
  print i
  i -= 1

until running == false do my_function!
```

<YueDisplay>

```yue
i = 10
until i == 0
  print i
  i -= 1
until running == false do my_function!
```

</YueDisplay>

Wie bei `for`-Schleifen kann die `while`-Schleife auch als Ausdruck verwendet werden. `while`- und `until`-Ausdrücke unterstützen `break` mit mehreren Rückgabewerten.

```yuescript
value, doubled = while true
  n = get_next!
  break n, n * 2 if n > 10
```

<YueDisplay>

```yue
value, doubled = while true
  n = get_next!
  break n, n * 2 if n > 10
```

</YueDisplay>

Damit eine Funktion den akkumulierten Wert einer `while`-Schleife zurückgibt, muss die Anweisung explizit mit `return` zurückgegeben werden.

## Repeat-Schleife

Die `repeat`-Schleife stammt aus Lua:

```yuescript
i = 10
repeat
  print i
  i -= 1
until i == 0
```

<YueDisplay>

```yue
i = 10
repeat
  print i
  i -= 1
until i == 0
```

</YueDisplay>

`repeat`-Ausdrücke unterstützen ebenfalls `break` mit mehreren Rückgabewerten:

```yuescript
i = 1
value, scaled = repeat
  break i, i * 100 if i > 3
  i += 1
until false
```

<YueDisplay>

```yue
i = 1
value, scaled = repeat
  break i, i * 100 if i > 3
  i += 1
until false
```

</YueDisplay>
