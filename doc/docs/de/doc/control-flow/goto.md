# Goto

YueScript unterstützt die goto-Anweisung und die Label-Syntax zur Steuerung des Programmflusses, wobei die gleichen Regeln wie bei Luas goto-Anweisung gelten. **Hinweis:** Die goto-Anweisung erfordert Lua 5.2 oder höher. Beim Kompilieren zu Lua 5.1 führt die Verwendung der goto-Syntax zu einem Kompilierfehler.

Ein Label wird mit doppelten Doppelpunkten definiert:

```yuescript
::start::
::done::
::mein_label::
```

<YueDisplay>

```yue
::start::
::done::
::mein_label::
```

</YueDisplay>

Die goto-Anweisung springt zu einem angegebenen Label:

```yuescript
a = 0
::start::
a += 1
goto done if a == 5
goto start
::done::
print "a ist jetzt 5"
```

<YueDisplay>

```yue
a = 0
::start::
a += 1
goto done if a == 5
goto start
::done::
print "a ist jetzt 5"
```

</YueDisplay>

Die goto-Anweisung ist nützlich, um aus tief verschachtelten Schleifen zu springen:

```yuescript
for z = 1, 10
  for y = 1, 10 do for x = 1, 10
    if x^2 + y^2 == z^2
      print 'Pythagoreisches Tripel gefunden:', x, y, z
      goto ok
::ok::
```

<YueDisplay>

```yue
for z = 1, 10
  for y = 1, 10 do for x = 1, 10
    if x^2 + y^2 == z^2
      print 'Pythagoreisches Tripel gefunden:', x, y, z
      goto ok
::ok::
```

</YueDisplay>

Sie können auch Labels verwenden, um zu einer bestimmten Schleifenebene zu springen:

```yuescript
for z = 1, 10
  for y = 1, 10
    for x = 1, 10
      if x^2 + y^2 == z^2
        print 'Pythagoreisches Tripel gefunden:', x, y, z
        print 'versuche nächstes z...'
        goto zcontinue
  ::zcontinue::
```

<YueDisplay>

```yue
for z = 1, 10
  for y = 1, 10
    for x = 1, 10
      if x^2 + y^2 == z^2
        print 'Pythagoreisches Tripel gefunden:', x, y, z
        print 'versuche nächstes z...'
        goto zcontinue
  ::zcontinue::
```

</YueDisplay>

## Hinweise

- Labels müssen innerhalb ihres Geltungsbereichs eindeutig sein
- goto kann zu Labels auf derselben oder äußeren Geltungsbereichsebenen springen
- goto kann nicht in innere Geltungsbereiche springen (wie in Blöcke oder Schleifen)
- Verwenden Sie goto sparsam, da es den Code schwieriger zu lesen und zu warten machen kann
