# Perulangan While

Perulangan while juga memiliki empat variasi:

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

Seperti loop for, loop while juga bisa digunakan sebagai ekspresi. Ekspresi `while` dan `until` mendukung `break` dengan banyak nilai.

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

Selain itu, agar sebuah fungsi mengembalikan nilai akumulasi dari loop while, pernyataannya harus di-return secara eksplisit.

## Repeat Loop

Loop repeat berasal dari Lua:

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

Ekspresi `repeat` juga mendukung `break` dengan banyak nilai:

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
