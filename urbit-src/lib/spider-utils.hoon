|%
+$  card  card:agent:gall
++  poke-spider
  |=  [our=@p return-tag=term args=vase]
  ^-  card
  [%pass [%spider-res return-tag ~] %agent [our %spider] %poke %spider-start args]
::
++  watch-spider
  |=  [our=@p return-tag=term tid=@ta]
  ^-  card
  [%pass [%spider-res return-tag ~] %agent [our %spider] %watch /thread-result/[tid]]
::
++  leave-spider
  |=  [our=@p return-tag=term]
  ^-  card
  [%pass [%spider-res return-tag ~] %agent [our %spider] %leave ~]
--
