::  gall-sub-watch
::  - watches graph-store
::  - pokes it
::  - gets the update returned
/-  spider
/+  strand, sio=strandio, *graph-store
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
;<  now=@da  bind:m  get-time:sio
;<  our=@p   bind:m  get-our:sio
=/  =wire  /graph-store/[(scot %da now)]
=/  add-graph1=cage
  :-  %graph-update
  !>([%0 now [%add-graph [our %test1] (gas:orm ~ ~) ~ %.y]])
;<  ~  bind:m  (watch-our:sio wire %graph-store /updates)
;<  ~  bind:m  (poke-our:sio %graph-store add-graph1)
;<  res=cage  bind:m  (take-fact:sio wire)
(pure:m !>(!<(update q.res)))
