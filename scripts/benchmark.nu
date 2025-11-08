#!/bin/nu

def main [image] {
  1..30
  | each {
    cargo r -r -q $image -t 4 --verbose o> /dev/null e>| lines
    | parse 'Palette generation took {time}ms'
    | get time.0
    | into int
  }
  | math avg
  | math round
  | into int
}
