#!/bin/nu

let w = 40
let images = 'img/unsplash/img'
let image = $images | path join 'Jewel Changi.jpg'

def swatch [] {
  let colors = lines | each { split row ' ' }

  let inner = (
    $colors
    | enumerate
    | each {|line|
      if $line.index == 0 {
        $line.item
        | enumerate
        | each {|color|
          $'  <use href="#swatch" x="($color.index * $w)" fill="rgb($color.item)"/>'
        }
      } else {
        let y = ($line.index * $w)
        $line.item
        | enumerate
        | each {|color|
          let x = ($color.index * $w)
          $'  <use href="#swatch" x="($x)" y="($y)" fill="rgb($color.item)"/>'
        }
      }
    }
    | flatten
    | str join (char newline)
  )

  let width = ($colors.0 | length) * $w
  let height = ($colors | length) * $w

  $'<svg height="($height)" viewBox="0 0 ($width) ($height)" xmlns="http://www.w3.org/2000/svg">
  <rect id="swatch" width="($w)" height="($w)"/>
($inner)
</svg>
'
}

def main [] {
  ls $images
  | get name
  | each {|img|
    let svg = (
      $img
      | path parse
      | update parent docs/palette
      | update extension svg
      | path join
    )
    cargo r -r -q $img -o rgb -s l | swatch | save -f $svg
  }

  [
    []
    [-l '10,30,50,70']
    [-w 0 -l '10,30,50,70']
    [-k 6 -w 0 -l '10,30,50,70']
  ]
  | enumerate
  | each {|entry|
    let svg = $'docs/cli/swatch($entry.index + 1).svg'
    cargo r -r -q $image ...$entry.item -o rgb | swatch | save -f $svg
  }

  null
}
