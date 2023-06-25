---
layout: post
title:  "The Dancing Stage Fusion dedicated cabinet"
date:   2023-06-13 14:00:00
categories: arcade ddr hardware
---

My knowledge about the Dancing Stage Fusion dedicated cabinet that was manufactured exclusively for
the release of the game with the same name.

This is the first article in a series documenting my knowledge about the hardware that is used in
the Dancing Stage Fusion cabinet. Various bits are not just applicable to that specific type of
cabinet because some hardware and wiring is shared with other cabinets, e.g. EXTIO PCB.

For further reading about other DDR/DS cabinet types, I suggest Jeffrey Carl's
[Types of DDR Cabinets and PCBs](https://jeffreyatw.com/blog/2019/03/types-of-ddr-cabinets-and-pcbs/)
blog post which provides a decent high level overview. However, it's not entirely accurate regarding
some information regarding DS Fusion.

## History

DS Fusion's
[product code](https://github.com/Shizmob/arcade-docs/blob/f76b4805bf6603b701d9beba0c5b5055352eda87/konami/products.md)
is `E33` which comes before Supernova's `FDH` by a full year. DS Fusion was 
[officially released in April 2005](https://remywiki.com/AC_DS_Fusion).

Remark: For details how Konami product codes work, see
[here](https://github.com/Shizmob/arcade-docs/blob/f76b4805bf6603b701d9beba0c5b5055352eda87/konami/identifiers.md#product-identifier).

The game was never released as a hardware upgrade kit for old cabinets. The software was only
shipped as dedicated cabinets manufactured by "Avranches Automatic" in France in 2005.

Assuming they never manufactured more than one batch of cabinets, which I consider unlikely
considering the European market was not great for Arcade games at that time, they manufactured
exactly 231 units.

How do I know that exact number? Sticker on the back of my cabinet:

![](/assets/dancing-stage-fusion-cabinet/cab-sticker.jpg)

Also, cabinet #1, yey.

## Hardware

The Dancing Stage Fusion cabinet is definitely unique regarding some of its hardware and wiring
setup. It is the only DDR/DS cabinet that uses the Playstation 2 based Python 1 hardware and first
cabinet to use the EXTIO PCB. The DS Fusion software is also the first game to use the EXTIO
hardware.

### Python 1 PCB images

<TODO pictures of python 1 PCB>

### EXTIO images

<TODO pictures of EXTIO>

## Wiring

For reference, here are
[the wiring diagrams from the official Dancing Stage Fusion cabinet manual](/assets/dancing-stage-fusion-cabinet/gke33-wiring-diagrams.pdf).
The manual was unfortunately an old print that was badly wrinkled. Please excuse the quality of the
scans.

The majority of the internal wiring relevant to IO is similar to any older cabinets that operated
on 573 digital/analog hardware, e.g. Japanese/Korean "black SD" cabinets (1st to 8th era), European
"black SD" Dancing Stage Euromix (1) and European "grey SD" Electrocoin Dancing Stange Euromix 2.

To some degree it is compatible though not fully pin/connector compatible.

### Two JAMMA edges

I will refer to the items in the wiring diagram throughout the article by their names in the wiring
diagram, e.g. `CN15` or `UNIT, PCB(A)`.

The key difference to other standard definition (SD) cabinet types is the second JAMMA edge.

The Python 1 PCB (`UNIT, PCB(A)`) has a primary JAMMA edge (`CN11`) and a secondary JAMMA edge
(`CN15`). The primary one is fully compatible with JAMMA edges from any other DDR/DS SD cabinets and
the
[JAMMA standard](https://en.wikipedia.org/wiki/Japan_Amusement_Machine_and_Marketing_Association).
The secondary edge just uses the JAMMA connector type and **is not** a JAMMA interface.

#### Primary JAMMA edge

Referred to as `CN11` in the wiring diagram.

##### Cabinet components connected

* Power, +5V and +12V to the Python 1 PCB
* RGB Video
* (No Audio)
* Player 1 and Player 2 dance pad inputs: up, down, left right
* Player 1 and Player 2 cabinet control inputs: menu left, menu right, start
* Operator cabinet inputs: test, service, coin
* Operator cabinet output: coin counter
* TODO what does EXT_IN do that goes to the EXTIO? (`EXT_IN`)

##### Pin out parts side ("top")

Full pin out from a stock Dancing Stage Fusion cabinet (NC = not connected):

* `1`: GND
* `2`: GND
* `3`: +5V
* `4`: NC
* `5`: NC
* `6`: +12V
* `7`: Notch, no pin
* `8`: Coin counter 1
* `9`: NC
* `10`: NC
* `11`: NC
* `12`: Video red
* `13`: Video blue
* `14`: Video ground
* `15`: Test switch
* `16`: Coin 1
* `17`: P1 start to cabinet start button
* `18`: P1 up to P1 dance stage + to EXTIO `EXT_IN` pin 1
* `19`: P1 down to P1 dance stage
* `20`: P1 left to P1 dance stage
* `21`: P1 right to P1 dance stage + to EXTIO `EXT_IN` pin 2
* `22`: NC
* `23`: P1 menu left to cabinet left button
* `24`: P1 menu right to cabinet right button
* `25`: NC
* `26`: NC
* `27`: GND
* `28`: GND

##### Pin out solder side ("bottom")

Full pin out from a stock Dancing Stage Fusion cabinet (NC = not connected):

* `A`: GND
* `B`: GND
* `C`: +5V
* `D`: NC
* `E`: NC
* `F`: +12V
* `H`: Notch, no pin
* `J`: Coin counter 2 (wiring available, but no coin counter installed on my cabinet)
* `K`: NC
* `L`: NC
* `M`: NC
* `N`: Video green
* `P`: Video composite sync
* `R`: Service switch
* `S`: NC
* `T`: Coin 2 (wiring available, but no coin switch installed on my cabinet)
* `U`: P2 start to cabinet start button
* `V`: P2 up to P2 dance stage + to EXTIO `EXT_IN` pin 3
* `W`: P2 down to P2 dance stage
* `X`: P2 left to P2 dance stage
* `Y`: P2 right to P2 dance stage + to EXTIO `EXT_IN` pin 4
* `Z`: NC
* `a`: P2 menu left to cabinet left button
* `b`: P2 menu right to cabinet left button
* `c`: NC
* `d`: NC
* `e`: GND
* `f`: GND

#### Secondary JAMMA edge

Referred to as `CN15` in the wiring diagram.

##### Cabinet components connected

* RS232 serial to EXTIO
* Marquee top lamps I/O from the sound AMP (board `UNIT,PCB(K)`, `CN42`)
* +5V out to bass neons (not shown in official wiring diagrams)

##### Pin out parts side ("top")

The pins on this side are referenced with `P1`, `P2` etc. for the parts side by the official wiring
diagram.

Full pin out from a stock Dancing Stage Fusion cabinet (NC = not connected):

* `P1`/`1`: NC
* `P2`/`2`: NC
* `P3`/`3`: NC
* `P4`/`4`: NC
* `P5`/`5`: Bridge, connected to `S6`
* `P6`/`6`: NC
* `P7`/`7`: `` to EXTIO
* `P8`/`8`: NC
* `P9`/`9`: NC
* `P10`/`10`: NC
* `P11`/`11`: Notch, no pin
* `P12`/`12`: NC
* `P13`/`13`: NC
* `P14`/`14`: NC
* `P15`/`15`: NC
* `P16`/`16`: NC
* `P17`/`17`: NC
* `P18`/`18`: NC
* `P19`/`19`: NC
* `P20`/`20`: NC
* `P21`/`21`: NC
* `P22`/`22`: NC
* `P23`/`23`: NC
* `P24`/`24`: 
* `P25`/`25`: 
* `P26`/`26`: 
* `P27`/`27`: NC
* `P28`/`28`: NC

##### Pin out solder side ("bottom")

The pins on this side are referenced with `S1`, `S2` etc. for the parts side by the official wiring
diagram.

Full pin out from a stock Dancing Stage Fusion cabinet (NC = not connected):

* `S1`/`A`: NC
* `S2`/`B`: NC
* `S3`/`C`: NC
* `S4`/`D`: NC
* `S5`/`E`: NC
* `S6`/`F`: Bridge, connected to `P5`
* `S7`/`H`: `` to EXTIO
* `S8`/`J`: `` to EXTIO
* `S9`/`K`: NC
* `S10`/`L`: NC
* `S11`/`M`: Notch, no pin
* `S12`/`N`: NC
* `S13`/`P`: NC
* `S14`/`R`: NC
* `S15`/`S`: NC
* `S16`/`T`: NC
* `S17`/`U`: NC
* `S18`/`V`: NC
* `S19`/`W`: NC
* `S20`/`X`: NC
* `S21`/`Y`: NC
* `S22`/`Z`: NC
* `S23`/`a`: 
* `S24`/`b`: 
* `S25`/`c`: 
* `S26`/`d`: 
* `S27`/`e`: NC
* `S28`/`f`: NC

### EXTIO

This one deserves its own article,
[see the next one in the series]({% link _posts/dancing-stage-fusion-extio.md %})