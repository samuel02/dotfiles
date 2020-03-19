if(exists("current_compiler"))
  finish
endif

let current_compiler = "scons"

set makeprg=scons\ -u\ \.
