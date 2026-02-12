# While Loop

The while loop also comes in four variations:

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

Like for loops, the while loop can also be used as an expression. While and until loop expressions support `break` with multiple return values.

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

Additionally, for a function to return the accumulated value of a while loop, the statement must be explicitly returned.

## Repeat Loop

The repeat loop comes from Lua:

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

Repeat loop expressions also support `break` with multiple return values:

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
