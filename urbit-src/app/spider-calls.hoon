::  spider-calls.hoon
::  Example calls to Spider
::
/+  dbug, default-agent, sutils=spider-utils
|%
+$  versioned-state
    $%  state-0
    ==
::
+$  state-0  [%0 counter=@]
::
+$  card  card:agent:gall
::
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this      .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  '%spider-calls initialized successfully'
  `this
++  on-save
  ^-  vase
  !>(state)
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  ~&  >  '%spider-calls recompiled successfully'
  `this(state !<(versioned-state old-state))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  ?+    mark  (on-poke:def mark vase)
     :: NOTE: %noun is just used for simplicity. You would generally do this with
     :: an app-specific mark
     ::
      %noun
    =/  tid=@ta  mk-tid
    ?+    q.vase  (on-poke:def mark vase)
        ::  example of combining 2 HTTP calls in one thread
        %compare-two-pages
      =/  args
        :^  ~  `tid  %http-two-pages
        !>([~ 'https://urbit.org' 'https://news.ycombinator.com'])
      :_  this
      :~  (poke-spider:sutils our.bowl %compare-two-pages !>(args))
          (watch-spider:sutils our.bowl %compare-two-pages tid)
      ==
      ::
      ::  TODO: add arvo calls here
    ==
  ==
  ++  mk-tid
    ^-  @ta
    (cat 3 'spider-calls--' (scot %uv eny.bowl))
  --
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?.  ?=([%spider-res @ *] wire)
    (on-agent wire sign)
  =/  return-tag=@tas  i.t.wire
  ?-    -.sign
      %poke-ack
    ?~  p.sign
      `this
    %-  (slog leaf+"{<return-tag>} couldn't start thread" u.p.sign)
    :_  this
    [(leave-spider:sutils our.bowl return-tag) ~]
    ::
      %watch-ack
    ?~  p.sign
      `this
    %-  (slog leaf+"{<return-tag>} couldn't start listening to thread" u.p.sign)
    `this
    ::
      %kick  `this
    ::
      %fact
    ~&  >>>  p.cage.sign
    ?+    p.cage.sign  (on-agent:def wire sign)
        %thread-fail
      %-  (slog leaf+"{<return-tag>} failed" !<(tang q.cage.sign))
      `this
        %thread-done
      %-  (slog leaf+"{<return-tag>} returned" ~)
      ?+    return-tag  ~|("Unrecognized return-tag" !!)
          %compare-two-pages
        ~&  >  !<([len1=@ud len2=@ud] q.cage.sign)
        `this
      ==
    ==
  ==
::
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
