---
layout: post
title: "State-Space Control of an Inverted Pendulum"
description: "Junior-Year course in advanced systems engineering (feedback control systems)"
published: true
tags: [projects]
---

<img src="{% asset 'e102.png' @path %}" alt="pencartulum control system block diagram" style="margin-left: auto; margin-right: auto"/>

E102 - Advanced Systems Engineering II is a junior-level course that's part of of HMC's engineering curriculum.

The course course covers LTI system transfer functions, Laplace/Z transforms, feedback control systems, modern state space methods, stability, etc.

For our final project, we were tasked with creating a feedback control system for an inverted pendulum on a cart, a.k.a. the 'pencartulum'. Given some position and angular offset, we must drive it to the origin, within a minimum time, offshoot, and oscillation constraints.

You can check out the final report below.

<iframe src="https://docs.google.com/viewer?url={{ site.url}}/files/E102FinalReport.pdf&embedded=true" width="100%" height="800px" frameborder="0" scrolling="no"></iframe>
