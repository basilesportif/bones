/-  spider
/+  strand, strandio
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=+  !<([~ url=tape] arg)
;<  body=cord  bind:m  (fetch-cord:strandio url)
(pure:m !>(body))
