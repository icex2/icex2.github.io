---
layout: post
title:  "Dancing Stage Fusion cabinet wiring harnesses for other PCBs"
date:   2023-06-13 14:00:00
categories: arcade ddr hardware
---

This article documents how the various wiring harnesses I build to connect Python 2, Python 3 and
573 digital PCBs to a stock Dancing Stage Fusion cabinet with Python 1 PCB wiring.

One of my goals was to not modify the existing wiring in my cabinet to keep it stock and reversible.
Any wiring harnesses in this article are plugging into the stock existing harness and can be
removed again. As a result, the cabinet can run all official DDR/Dancing Stage hardware including
the Python 1 hardware that was only used on Dancing Stage Fusion.

## Getting the connectors to build the harness

At the time of writing this, sort of impossible. back orders are said to be 300+ days on many places i checked.
i decided to go for the precision sockets that aren't great but fit the pins. additional labeling of these
help to avoid plugging them in the wrong way.

In general, due to missing the proper parts, everything is sort of improvised.

Here is the part list:

* 

## Python 1 -> Python 2 wiring harness

### Second jamma connector breakout

### Card readers

### Monitor 15/31 switch

## Python 2 -> 573 digital adapters

* Use now existing python 2 wiring since it is already fairly close to the 573 wiring





## Pinout card reader P1 -> P2 mini din8 male to mini din8 male

Port 1 2 and 3: 

* Pin 3: TX
* Pin 4: GND
* Pin 5 : RX

Pin 3 and 5 need to be reversed inbetween readers 
They are all the same, so your cable needs to bridge them over.
A standard male to male mini din 8 cable does not do that.

### Pinout card reader stock cable s-sub9 to round pin9

```text
dsub-9 female -> mini-din8 male
2 (TXD) -> 3
3 (RXD) -> 5
5 (GND) -> 4
```

## ADE board and com port assignments

Default or incorrectly configured?

* `COM1` -> on mainboard
* `COM2` -> COM2 on P3IO breakout
* `COM3` -> ???
* `COM4` -> COM1 on P3IO breakout

