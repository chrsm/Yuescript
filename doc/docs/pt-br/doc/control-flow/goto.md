# Goto

YueScript suporta a instrução goto e a sintaxe de rótulos para controlar o fluxo do programa, seguindo as mesmas regras da instrução goto do Lua. **Nota:** A instrução goto requer Lua 5.2 ou superior. Ao compilar para Lua 5.1, o uso da sintaxe goto resultará em um erro de compilação.

Um rótulo é definido usando dois pontos duplos:

```yuescript
::inicio::
::fim::
::meu_rotulo::
```

<YueDisplay>

```yue
::inicio::
::fim::
::meu_rotulo::
```

</YueDisplay>

A instrução goto salta para um rótulo especificado:

```yuescript
a = 0
::inicio::
a += 1
goto fim if a == 5
goto inicio
::fim::
print "a agora é 5"
```

<YueDisplay>

```yue
a = 0
::inicio::
a += 1
goto fim if a == 5
goto inicio
::fim::
print "a agora é 5"
```

</YueDisplay>

A instrução goto é útil para sair de laços profundamente aninhados:

```yuescript
for z = 1, 10
  for y = 1, 10 do for x = 1, 10
    if x^2 + y^2 == z^2
      print 'triplo pitagórico encontrado:', x, y, z
      goto ok
::ok::
```

<YueDisplay>

```yue
for z = 1, 10
  for y = 1, 10 do for x = 1, 10
    if x^2 + y^2 == z^2
      print 'triplo pitagórico encontrado:', x, y, z
      goto ok
::ok::
```

</YueDisplay>

Você também pode usar rótulos para pular para um nível específico de laço:

```yuescript
for z = 1, 10
  for y = 1, 10
    for x = 1, 10
      if x^2 + y^2 == z^2
        print 'triplo pitagórico encontrado:', x, y, z
        print 'tentando próximo z...'
        goto zcontinue
  ::zcontinue::
```

<YueDisplay>

```yue
for z = 1, 10
  for y = 1, 10
    for x = 1, 10
      if x^2 + y^2 == z^2
        print 'triplo pitagórico encontrado:', x, y, z
        print 'tentando próximo z...'
        goto zcontinue
  ::zcontinue::
```

</YueDisplay>

## Notas

- Rótulos devem ser únicos dentro de seu escopo
- goto pode pular para rótulos nos mesmos níveis de escopo ou externos
- goto não pode pular para escopos internos (como dentro de blocos ou laços)
- Use goto com moderação, pois pode tornar o código mais difícil de ler e manter
