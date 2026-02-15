# Bedingungen

```yuescript
have_coins = false
if have_coins
  print "Münzen erhalten"
else
  print "Keine Münzen"
```

<YueDisplay>

```yue
have_coins = false
if have_coins
  print "Münzen erhalten"
else
  print "Keine Münzen"
```

</YueDisplay>

Eine Kurzsyntax für einzelne Anweisungen kann ebenfalls verwendet werden:

```yuescript
have_coins = false
if have_coins then print "Münzen erhalten" else print "Keine Münzen"
```

<YueDisplay>

```yue
have_coins = false
if have_coins then print "Münzen erhalten" else print "Keine Münzen"
```

</YueDisplay>

Da `if`-Anweisungen als Ausdrücke verwendet werden können, kann man das auch so schreiben:

```yuescript
have_coins = false
print if have_coins then "Münzen erhalten" else "Keine Münzen"
```

<YueDisplay>

```yue
have_coins = false
print if have_coins then "Münzen erhalten" else "Keine Münzen"
```

</YueDisplay>

Bedingungen können auch in `return`-Anweisungen und Zuweisungen verwendet werden:

```yuescript
is_tall = (name) ->
  if name == "Rob"
    true
  else
    false

message = if is_tall "Rob"
  "Ich bin sehr groß"
else
  "Ich bin nicht so groß"

print message -- gibt aus: Ich bin sehr groß
```

<YueDisplay>

```yue
is_tall = (name) ->
  if name == "Rob"
    true
  else
    false

message = if is_tall "Rob"
  "Ich bin sehr groß"
else
  "Ich bin nicht so groß"

print message -- gibt aus: Ich bin sehr groß
```

</YueDisplay>

Das Gegenteil von `if` ist `unless`:

```yuescript
unless os.date("%A") == "Monday"
  print "Es ist nicht Montag!"
```

<YueDisplay>

```yue
unless os.date("%A") == "Monday"
  print "Es ist nicht Montag!"
```

</YueDisplay>

```yuescript
print "You're lucky!" unless math.random! > 0.1
```

<YueDisplay>

```yue
print "You're lucky!" unless math.random! > 0.1
```

</YueDisplay>

## In-Ausdruck

Mit einem `in`-Ausdruck kannst du Bereichsprüfungen schreiben.

```yuescript
a = 5

if a in [1, 3, 5, 7]
  print "Gleichheitsprüfung mit diskreten Werten"

if a in list
  print "Prüfen, ob `a` in einer Liste ist"
```

<YueDisplay>

```yue
a = 5

if a in [1, 3, 5, 7]
  print "Gleichheitsprüfung mit diskreten Werten"

if a in list
  print "Prüfen, ob `a` in einer Liste ist"
```

</YueDisplay>

Der `in`-Operator kann auch mit Tabellen verwendet werden und unterstützt die Variante `not in` für Verneinungen:

```yuescript
has = "foo" in {"bar", "foo"}

if a in {1, 2, 3}
  print "a ist in der Tabelle"

not_exist = item not in list

check = -> value not in table
```

<YueDisplay>

```yue
has = "foo" in {"bar", "foo"}

if a in {1, 2, 3}
  print "a ist in der Tabelle"

not_exist = item not in list

check = -> value not in table
```

</YueDisplay>

Eine Ein-Element-Liste oder Tabelle prüft auf Gleichheit mit diesem Element:

```yuescript
-- [1,] prüft, ob wert == 1
c = a in [1,]

-- {1} prüft auch, ob wert == 1
c = a in {1}

-- Ohne Komma ist [1] ein Indexzugriff (tb[1])
with tb
  c = a in [1]
```

<YueDisplay>

```yue
-- [1,] prüft, ob wert == 1
c = a in [1,]

-- {1} prüft auch, ob wert == 1
c = a in {1}

-- Ohne Komma ist [1] ein Indexzugriff (tb[1])
with tb
  c = a in [1]
```

</YueDisplay>
