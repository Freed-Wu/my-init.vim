call c#map#main()

setlocal path+=~/Arduino/libraries/**
setlocal path+=~/.arduino15/packages/arduino/hardware/avr/1.8.2/**
setlocal makeprg=arduino\ %:p\ --verify

