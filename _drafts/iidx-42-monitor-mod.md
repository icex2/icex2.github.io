---
layout: post
title:  "BeatmaniaIIDX 37\" to 42\" monitor mod"
date:   2023-06-13 14:00:00
categories: arcade beatmaniaiidx hardware
---

Why?

Probably the type of official monitor that players like the least.

* 42" monitor size is the future standard size
  * 42" LCD (upgrade) starting Cannon Ballers
  * 42" LCD on lightning cabinets (TDJ)
* The downscaler of the firmware is bad
  * Yellow taint on entire picture
  * Ghosting, especially notable on the white notes on higher scroll speeds
  * Downscaler applies some weird stuff to improve picture quality which introduce notable lag. one
    of them can't even be turned off as it turns back on once the screen resets due to a signal change
  * Less stable monitor refresh rate which leads to less stable game play/stuttering experience/timing because the game's engine depends on a stable monitor refresh rate
  * Apparently also higher latency though this is purely based on personal game play feeling

Limitations:

* Only possible with the following monitor models as these have a 42" panel mounted inside the housing
  which is only covered up by a smaller bezel
  * [GULDJ-JI](https://github.com/Shizmob/arcade-docs/blob/main/konami/product/GULDJ-JI.md): "Pendual LCD"
  * [GULDJ-JJ](https://github.com/Shizmob/arcade-docs/blob/main/konami/product/GULDJ-JJ.md): "Copula LCD"

Steps/sections:

* Remove the 37" "downsizing" bezel
* Open the side to uncover the menu buttons
* Apply a 1080p signal to the screen. recommending using the DVI port of the screen.
  the screen shows different OSDs depending on the resolution.
  the picture size/zooming options are not available when giving the screen a 720p signal
* Go to the OSD and reset all the screen resize/zoom parameters to stretch the picture to the entire
  screen
* Note that the screen will still fallback to the bad downscaler for 720p signals. therefore, this
  will not fix the gameplay experience if you use an official PCB with official/unmodified software
  for anything below iidx 30 running in full HD. The game (not the OS!) needs to create a render
  window/frame buffer in 1080p in full screen.
* Wrap-up: Put existing bezel on the side?
* TODO: need a proper bezel reproduction to have the full 42" panel exposed