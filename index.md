---
permalink: '/index.html'
---

### The Problems

The Shapeoko 2 kit is fairly easy to assemble, and once you get it put together it's not too hard to print out the little "Shapeoko 2" logo using a Sharpie. But going much beyond that, you can quickly find that what you really need now is $300 or so worth of software. Trying to use an open-source toolchain is a long and bumpy road, and full of a lot of hard lessons. 

Beyond software, the basic Shapeoko itself leaves something to be desired. While it's capable of sub-millimeter precision, it's lack of homing switches means finding an accurate starting point is a manual task. This in turn means whatever depth you plan for pocket operations is an estimate. And if you design a cut bigger than your cutting area, there's nothing to stop your Shapeoko from trying anyway.

Specifically, these are the problems this project will try to address:

#### Hardware

* [No homing/limit switches](limit-switches.html)
* [Probe to home Z axis](z-probe.html)
* [Measuring material dimensions](material-dimensions.html)
* [Computer / Arduino management](electronic-management.html)
* [Dust Management](dust-management.html)
* [Clamping / Work-holding](clamping.html)

#### Software

* [Open source CAM software is a mess](cam.html)
  * pyCAM needs python 2.6, which is getting harder to come by
  * pyCAM isn't all that healthy as software projects go...
* [gcode isn't gcode](gcode-processing.html)
  * some CAM software doesn't generate gcode compatible with grbl
