# Loop While

O loop while também vem em quatro variações:

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

Como os loops for, o loop while também pode ser usado como expressão. Expressões `while` e `until` suportam `break` com múltiplos valores.

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

Além disso, para uma função retornar o valor acumulado de um loop while, a instrução deve ser explicitamente retornada.

## Loop Repeat

O loop repeat vem do Lua:

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

Expressões `repeat` também suportam `break` com múltiplos valores:

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
