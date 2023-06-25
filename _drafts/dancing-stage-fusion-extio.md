---
layout: post
title:  "Dancing Stage Fusion - EXTIO PCB hardware"
date:   2023-06-13 14:00:00
categories: arcade ddr hardware
---

My knowledge about the EXTIO PCB that was introduced with Dancing Stage Fusion but is still used
on standard definition DDR cabinets today.

This is the third article in a series of knowledge articles about the Dancing Stage Fusion
cabinet and hardware.

For wiring diagrams, please see the
[first article]({% link _posts/dancing-stage-fusion-cabinet.md %}). Various identifiers throughout
the article, e.g. `GN845-PWB(B)`, reference items or connectors from the wiring diagrams.

## Hardware history

The 573 digital hardware that was used by the latest game iterations prior to Fusion. For I/O, the
base board (`GX700-PWB(A)B`) only supported a general JAMMA interface that interfaced with the 
following cabinet I/O:

* Player 1 and player 2 dance pad arrow panels: up, down, left and right
* Player 1 and Player 2 cabinet control inputs: menu left, menu right, start
* Operator cabinet inputs: test, service, coin
* Operator cabinet output: coin counter

Remark: For this article, cabinet I/O excludes video and sound.

An additional daughter board, referred to as the "573 digital IO", enables digital (MP3) audio
decoding and the following additional cabinet I/O:

* Player 1 and player 2 dance stage arrow panel light outputs for individual arrow panels up, down,
  left and right
* Bass neon light output
* Control sensor read mode on IO board in the dance stage, aka "stage IO" (`GN845-PWB(B)`)

Some useful references from MAME regarding the 573 digital hardware that is fully supported today:

* [ksys573 driver](https://github.com/mamedev/mame/blob/master/src/mame/konami/ksys573.cpp): The 
  system 573 hardware driver
* [k573dio driver module](https://github.com/mamedev/mame/blob/master/src/mame/konami/k573dio.cpp):
  Additional 573 digital IO board module for the system 573 driver

## The EXTIO

Moving away from the Playstation 1 based 573 digital hardware and to the Playstation 2 based Python
1 hardware with Dancing Stage Fusion, the game still required the support of the same cabinet I/O.

For the Python 1 hardware, the solution was to keep the JAMMA compatible interface and move the
remaining I/O to a separate PCB, the EXTIO (`UNIT,PCB(I)`), part number `0000382222`.

From the Python 1 hardware generation onwards, the EXTIO is required by all successors to connect
the cabinet I/O of standard definition cabinets of different generations.

This includes the Python 2 hardware (DDR/DS Supernova, DDR Supernova 2) as well as the successor
PC-based hardware using a Python 3 IO board (DDR X and newer).

Additionally, with the introduction of the "black HD cabinet" type (dedicated cabinet shipped with
DDR X to DDR X3 in Japan), this cabinet is also equipped with the EXTIO.

Starting the game version DDR 2013, the "white cabinets" shipped with PCBs using the Python 4 IO
that do not require the EXTIO anymore. This also includes the "gold cabinets" that were released
for DDRs 20th anniversary.

For further reading about the different cabinet types, I suggest Jeffrey Carl's
[Types of DDR Cabinets and PCBs](https://jeffreyatw.com/blog/2019/03/types-of-ddr-cabinets-and-pcbs/)
blog post which provides a decent high level overview.

## Features

Already mentioned above implicitly, but for visibility and clarity sake, these are the high level
features of the EXTIO:

* Player 1 and player 2 dance stage arrow panel light outputs
* Bass neon light output
* Control sensor read mode on IO board in the dance stage, aka "stage IO" (`GN845-PWB(B)`)

## PCB

### Images

### Connections/interfaces

* `CN1`: +12V Power in
* `CN2`: RS232 serial connection main PCB
  * On Python 1 I/O hardware (Playstation 2), connects to secondary JAMMA edge (pin out follows in
    separate article)
  * On Python 2 I/O hardware (Playstation 2), connects to the `COM1` on the PCB breakout panel
  * On Python 3 I/O hardware (PC), connects to `COM1` on the PCB breakout panel
* `CN3`: `EXT_IN` <TODO what is this one doing?> goes to primary JAMMA blade on fusion
* `CN4`: Bass neon out
* `CN5`: Player 2 dance stage out (arrow lights and stage IO control)
* `CN6`: Player 1 dance stage out (arrow lights and stage IO control)

## Dance stage sensor read mode

Each dance stage arrow has a set of four sensors arranged in cardinal direction. But, most of the
time, the game only wants to know if the player triggered a particular arrow panel, not individual
sensor. Therefore, the following two sensor modes exist.

### Polling mode

The stage IO collects inputs of all four sensors of each panel and merges them to a single state.
The merged state is made available on the primary JAMMA connectors pins for up, down, left and
right. This is done at a high refresh rate on the stage IO to ensure low latency inputs. This is the
default and primary mode used by the game during game play.

### Individual sensor mode

Only used in the IO test sub-menu of the operator/test menu to test and debug individual sensors. The
EXTIO tells the stage IO which sensor to mask. The stage IO makes the result of the single sensor
available on the primary JAMMA connectors pins for up, down, left and right for each panel on the
dance stage. In order to get inputs from all individual sensors, the game cycles through them which
is significantly slower than the polling mode but acceptable for the given use-case.

## Driver code for Windows

Connecting the EXTIO to a COM port on a Windows PC, you can use
[EXTIO driver in bemanitools](https://github.com/djhackersdev/bemanitools/blob/master/src/main/extiodrv/device.h)
to communicate with the hardware.

A [command line tools for testing](https://github.com/djhackersdev/bemanitools/blob/master/src/main/extiotest/main.c)
and another for [testing in combination with a P3IO](https://github.com/djhackersdev/bemanitools/blob/master/src/main/p3io-ddr-tool/main.c)
are also available to test and debug the hardware.