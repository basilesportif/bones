::  http/two-pages.hoon
::  - stupid thread to return body lengths of 2 web pages
::  - example of how to chain multiple HTTP calls in a thread
::
::  args:
::  - [url1=cord url2=cord]
::
::  returns:
::  - [length-page1 length-page2]
::
/-  spider
/+  strand, strandio
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
~&  >>  !<([~ cord cord] arg)
=/  m  (strand ,vase)
^-  form:m
=+  !<([~ url1=cord url2=cord] arg)
;<  body1=cord  bind:m  (fetch-cord:strandio (trip url1))
;<  body2=cord  bind:m  (fetch-cord:strandio (trip url2))
(pure:m !>([(met 3 body1) (met 3 body2)]))
