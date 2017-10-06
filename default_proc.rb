h = {
  1 => {
    "\r": :enter,
    "\t": :tab
  }.default_proc = -> hash, _key { 42 },
  2 => {
    sss: :ddd,
    ddd: :sss
  }
}

p h
