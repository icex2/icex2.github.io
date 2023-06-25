---
layout: post
title:  "Dance Dance Revolution PCB breakouts, wiring and pin outs"
date:   2023-06-13 14:00:00
categories: arcade ddr hardware
---

Sharing this as I had to gather all this information from various sources like manuals and talking
to people to solve my problem of hooking up different generations of PCBs to my Dancing Stage
Fusion cabinet correctly. Officially, no upgrade kits were ever released for that cabinet.

TODO i already started something in arcade-docs, consider migrating this and figure out how to
break this up into meaningful chunks

## Commonly used connectors, overview

Limited to game I/O related stuff that I personally had to buy for some wiring harnesses.

### XM 06V

* Receptacle: `XMR-06V`
* Plug: `XMP-06V`
* Usage
  * Bass neon 573 digital
  * COM3-4 P3IO

### XM 10V

* Receptacle: `XMR-10V`
* Plug: `XMP-10V`
* Usage
  * Marquee lights 573 digital
  * P1 and P2 stage IO 573 digital

### XM 11V

* Receptacle: `XMR-11V`
* Plug: `XMP-11V`
* Usage
  * Marquee lights P2IO/P3IO

### Misc TODO

* `B10B-XH-A (LF)(SN)` or `B10B-XH-2` ??? - `???`
  * P1 stage IO EXTIO connection
* `B12B-XH-A (LF)(SN)` or `B12B-XH-2` ??? - `???`
  * P2 stage IO EXTIO connection
* `B5B-EH-A` - `EHR-5` - `EH BEH-001T-P0.6`
  * COM1 on Python 2/3 IO
* `S3B-XH-A` - `XHP-3` - ``
  * COM2 on Python 2/3 IO
* `VLR-03V` - `VLP-03V` - ``

## I/O breakouts

Describing the a side of the PCB that provides several connectors and interfaces to hook up any
I/O external to the PCB, i.e. everything from the cabinet.

All documented connections that are relevant to cabinet hardware of an upgraded DDR/DS 573 wiring-
based SD cabinet including:

* Japanese/Korean black SD cabinet (1st to 8th)
* European black SD cabinet, Dancing Stage Euromix 1
* European grey SD cabinet, Dancing Stage Euromix 2
* European black SD cabinet, Dancing Stage Fusion

Might also apply to dedicated cabinets shipping with Supernova 1/2 and japanese red SD cabinets as
well as Japanese black HD cabinets, though unverified.

NC = no connection

### 573 digital

* `JAMMA`: JAMMA edge with pin compatible JAMMA interface
  * +5V and +12V power in to power the I/O
  * RBG video out
  * No audio
  * Operator inputs: Test, service, coin 1/2
  * Operator outputs: Coin counter 1/2
  * Player 1/2 dance pad inputs: up, down, left, right
  * Player 1/2 menu inputs: start, menu left, menu right
* `LINE OUT 1`: Primary audio out to amplifier
* `RGB` (not labeled): Video out to monitor
* `TEST`: Recessed test button
* `DIP`: Dip switches
  * `1`: ???
  * `2`: ???
  * `3`: ???
  * `4`: Off = boot from disc (install game), On = boot from flash (boot game)
* `JVS` (not labeled): JVS port to external memory card IO board
* `1P` (not necessarily labeled), color white
  * Connects to player 1 dance stage IO
  * [XM 10V](#xm-10v)
* `2P` (not necessarily labeled), color orange
  * Connects to player 2 dance stage IO
  * [XM 10V](#xm-10v)
* `LAMP` (not necessarily labeled), color red
  * Connects to sound AMP for marquee top lights
  * [XM 10V](#xm-10v)
* `NEON` (not necessarily labeled), color white
  * Connects to bass neons relay
  * [XM 6V](#xm-6v)

### Python 1

* Primary JAMMA edge (`CN11`)
  * Power, +5V and +12V to the Python 1 PCB
  * RGB video out
  * (No Audio)
  * Player 1/2 dance pad inputs: up, down, left right
  * Player 1/2 cabinet control inputs: menu left, menu right, start
  * Operator cabinet inputs: test, service, coin 1/2
  * Operator cabinet output: coin counter 1/2
  * EXTIO inputs (`EXTIO_IN`) to EXTIO for individual sensor mode reading
* Secondary JAMMA edge (`CN15`)
  * Bridged pins to identify cabinet type (Fusion only)
  * RS232 serial to EXTIO
  * Marquee top lamps I/O from the sound AMP
  * +5V out to bass neons (not shown in official wiring diagrams)
* `LINE OUT`: Audio out to amplifier

#### Primary JAMMA edge pin out

Full pin out from a stock Dancing Stage Fusion cabinet.

##### Parts side ("top")

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
* `14`: Video GND
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

##### Solder side ("bottom")

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

Full pin out from a stock Dancing Stage Fusion cabinet.

##### Pin out parts side ("top")

The pins on this side are referenced with `P1`, `P2` etc. for the parts side by the official wiring
diagram.

* `P1`/`1`: NC
* `P2`/`2`: NC
* `P3`/`3`: +5V (red) to bass neons, not in the manual
* `P4`/`4`: NC
* `P5`/`5`: Bridge cable (brown), connects to `S6`
* `P6`/`6`: NC
* `P7`/`7`: Serial TX to EXTIO (purple)
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
* `P24`/`24`: P2 cabinet button lights (yellow-grey) to sound amplifier
* `P25`/`25`: Marquee lights P1 halo up (light blue) to sound amplifier
* `P26`/`26`: Marquee lights P2 halo down (grey) to sound amplifier
* `P27`/`27`: GND for +5V (black) to bass neons, not in the manual
* `P28`/`28`: NC

##### Pin out solder side ("bottom")

The pins on this side are referenced with `S1`, `S2` etc. for the parts side by the official wiring
diagram.

* `S1`/`A`: NC
* `S2`/`B`: NC
* `S3`/`C`: NC
* `S4`/`D`: NC
* `S5`/`E`: NC
* `S6`/`F`: Bridge cable (brown), connected to `P5`
* `S7`/`H`: RX serial to EXTIO (grey)
* `S8`/`J`: GND serial to EXTIO (black)
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
* `S23`/`a`: P1 cabinet button lights (purple-grey) to sound amplifier
* `S24`/`b`: Marquee lights P2 halo up (green) to sound amplifier
* `S25`/`c`: Marquee lights P1 halo down (purple) to sound amplifier
* `S26`/`d`: Marquee lights GND (black) to sound amplifier
* `S27`/`e`: NC
* `S28`/`f`: NC

#### Marquee lights connector to amplifier

Lights I/O connector that goes into the AMP box. Pin out order: looking at the front of the
connector, left to right:

* `1`: Earth (yellow-green)
* `2`: P2 halo down (grey)
* `3`: P1 halo down (purple)
* `4`: P1 halo up (light blue)
* `5`: P2 halo up (green)
* `6`: P2 cabinet button lights (yellow-grey)
* `7`: P1 cabinet button lights (purple-grey)
* `8`: NC
* `9`: GND (black)

#### EXT I/O serial connector

Serial connector going to the EXT I/O board. Pin out order: looking at the front of the connector,
left to right:

* `1`: GND (black)
* `2`: TX (purple)
* `3`: RX (grey)

### Python 2

* `JAMMA`: JAMMA edge with pin compatible JAMMA interface
  * +5V and +12V power in to power the I/O (required)
  * RBG video out
  * No audio
  * Operator inputs: Test, service, coin 1/2
  * Operator outputs: Coin counter 1/2
  * 15/31 khz video output select (software controlled) bridge (optional): TODO wasn't that tilt to ground?
  * Player 1 and player 2 dance pad inputs: up, down, left, right
  * Player 1 and player 2 menu inputs: start, menu left, menu right
  * `EXT_IN`: EXTIO inputs for individual sensor mode, see
    [my EXTIO article]({% link _posts/dancing-stage-fusion-extio.md %}) for details
* `LINE OUT 1`: Primary audio out to amplifier
* `LINE OUT 2`: N.C.
* `RGB`: Video out to monitor, supports 15khz/31khz based on hardware switch for video freq/mode
         selection
* `COM1`: Virtual com port that connects to the EXTIO
* `COM2`: Virtual com port that connects to a pair of ICCA card readers
* `LAN`: Network connection
* `PWR`: 100V power in
* `ANALOG`: NC
* `PORT 1`: Lights output for cabinet lights, e.g. menu button lights, top header lights
* `PORT 2`: NC
* `DIPSW`
  * `1`: ???
  * `2`: On = force all sensor polling mode and allow running the game without an EXTIO
  * `3`: ???
  * `4`: On = force 15 khz monitor output
* `PLUG 1`: Roundplug black dongle
* `PLUG 2`: Roundplug white dongle

#### COM1

Looking at receptacle, pins left to right:

* `1`: TXD(1)
* `2`: RXD(1)
* `3`: NC
* `4`: NC
* `5`: GND

#### COM2

Looking at receptacle, pins left to right:

* `1`: TXD(2)
* `2`: RXD(2)
* `3`: GND

### Python 3 - GF/DM, Chimera

Descriptions assume usage of a P3IO from a GF/DM in a "chimera style PCB build".

* `JAMMA`: JAMMA edge with pin compatible JAMMA interface
  * +5V and +12V power in to power the I/O (required)
  * RBG video out
  * No audio
  * Operator inputs: Test, service, coin 1/2
  * Operator outputs: Coin counter 1/2
  * 15/31 khz video output select (software controlled) bridge (optional): TODO wasn't that tilt to ground?
  * Player 1 and player 2 dance pad inputs: up, down, left, right
  * Player 1 and player 2 menu inputs: start, menu left, menu right
* `PWR`: 100V power in
* `12V-OUT`: +12V out for external devices, NC
* `PORT 1`: Lights output for cabinet lights, e.g. menu button lights, top header lights
* `PORT 2`: NC
* `COM1`: Virtual COM port VCOM0, connects to EXTIO
* `COM2`: Vortual COM port VCOM1, NC
* `RGB`: Video out to monitor, supports 15khz/31khz based on hardware switch for video freq/mode
         selection
* `LINE OUT 1`: Primary audio out to amplifier
* `LINE OUT 2`: NC
* `DIPSW`
  * `1`: ???
  * `2`: On = force all sensor polling mode and allow running the game without an EXTIO
  * `3`: ???
  * `4`: On = force 15 khz monitor output
* `PLUG 1`: Roundplug black dongle
* `PLUG 2`: Roundplug white dongle

#### COM1

Looking at receptacle, pins left to right:

* `1`: TXD(1)
* `2`: RXD(1)
* `3`: NC
* `4`: NC
* `5`: GND

#### COM2

Looking at receptacle, pins left to right:

* `1`: TXD(2)
* `2`: RXD(2)
* `3`: GND

### Python 3 - DDR(X), Dragon

* `JAMMA`: JAMMA edge with pin compatible JAMMA interface
  * +5V and +12V power in to power the I/O (required)
  * RBG video out
  * No audio
  * Operator inputs: Test, service, coin 1/2
  * Operator outputs: Coin counter 1/2
  * 15/31 khz video output select (software controlled) bridge (optional): TODO wasn't that tilt to ground?
  * Player 1 and player 2 dance pad inputs: up, down, left, right
  * Player 1 and player 2 menu inputs: start, menu left, menu right
  * `EXT_IN`: EXTIO inputs for individual sensor mode, see
    [my EXTIO article]({% link _posts/dancing-stage-fusion-extio.md %}) for details
* `PWR`: 100V power in
* `USB`: USB memory card readers on cabinet, optional
* `PORT 1`: Lights output for cabinet lights, e.g. menu button lights, top header lights
* `COM3-4`: Virtual COM ports
  * COM3 (VCOM1): Pins 1,3,5 on connector -> To card readers
  * COM4 (VCOM0): Pins 2,4,6 on connector -> NC
* `PLUG`: Breakout to security round plugs (black and white dongles)
* `COM1`: Connects to EXTIO
  * Passthrough COM port to mainboard
  * Pin out (pins left to right)
    * 1: TXD1
    * 2: RXD1
    * 3: N.C.
    * 4: N.C.
    * 5: GND
* `COM2`: NC on SD cabinets, connects to light spires on black HD cabinet
  * Passthrough COM port to mainboard
  * Pin out (pins left to right)
    * 1: TXD2
    * 2: RXD2
    * 3: GND
* `RGB`: Video out to monitor, supports 15khz/31khz based on hardware switch for video freq/mode
         selection
* `LINE OUT1`: Primary audio out to amplifier
* `LINE OUT2`: NC
* `LAN`: Network
* `DIP SW`
  * `1`: ???
  * `2`: On = force all sensor polling mode and allow running the game without an EXTIO
  * `3`: ???
  * `4`: On = force 15 khz monitor output

#### COM1

`CN19`, looking at receptacle, pins left to right:

* `1`: TXD(1)
* `2`: RXD(1)
* `3`: NC
* `4`: NC
* `5`: GND

#### COM2

`CN18`, looking at receptacle, pins left to right:

* `1`: TXD(2)
* `2`: RXD(2)
* `3`: GND

#### PORT1

Looking at receptacle, pins right to left:

* `1`: GND
* `2`: P1 cabinet button lights
* `3`: P2 cabinet button lights
* `4`: NC
* `5`: NC
* `6`: GND
* `7`: Marquee P2 halo down
* `8`: Marquee P2 halo up
* `9`: Marquee P1 halo down
* `10`: Marquee P1 halo up
* `11`: NC

#### COM3-4

Looking at receptacle, pins right to left:

* `1`: TXD0
* `2`: TXD1
* `3`: RXD0
* `4`: RXD1
* `5`: GND
* `6`: GND

## IO boards and differences

A few key differences about the different I/O boards used that are often asked.

### 573 digital IO

* "Digital IO" daughter board attached to mainboard
  * MP3 audio decoding
  * Handling of any cabinet I/O the JAMMA standard does not support

### P1IO Dancing Stage Fusion

* Double JAMMA edge though secondary is not JAMMA interface compatible
* First hardware/game to use EXTIO to handle cabinet I/O not supported by standard JAMMA

### P2IO DDR

* Connects to USB and actually enumerates as a USB device and not a virtual COM port
* COM ports 1-2 on breakout of the PCB are just virtual COM ports
  * Do not show up as COM ports on the operating system
  * The game drives the COM ports through the main P3IO protocol with additional P3IO commands
    to open, read, write and close these virtual COM ports
* EXTIO to handle cabinet I/O not supported by standard JAMMA

### P3IO DDR(X) - Dragon

* Often referred to as "the dragon PCB/IO"
* Connects to USB and actually enumerates as a USB device
* COM ports 1-2 on breakout of the PCB are being passed through to COM port headers on the mainboard
  and enumerate as native COM ports on the operating system
* COM ports 3-4 on the breakout panel are virtual COM ports that run all data over the P3IO
  protocol. They need to be communicated in the client/game software and do not show up on the
  operating system level.
* EXTIO to handle cabinet I/O not supported by standard JAMMA

### P3IO GF/DM - Chimera

* Not official, community build, (mostly) compatible with the official P3IO (dragon) but requires
  software hooking to route VCOM0 to native COM4
* Connects to USB and actually enumerates as a USB device
* COM ports 1-2 on breakout of the PCB are just virtual COM ports
* These do not show up as COM ports on the operating system
* The game drives the COM ports through the main P3IO protocol with additional P3IO commands
  to open, read, write and close these virtual COM ports
* EXTIO to handle cabinet I/O not supported by standard JAMMA