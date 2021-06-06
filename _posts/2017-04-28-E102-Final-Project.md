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

For our final project, I conducted a feedback control simulation study for an inverted pendulum on a cart, a.k.a. the 'pencartulum'. Given some position and angular offset, the goal was to drive it to the origin, within minimum-time, offshoot, and acceleration constraints.

You can check out the final report below.

<div id="pdf_preview"></div>
<script>
var filename = "E102FinalReport.pdf";
var pdf_path = "{{ site.url }}/files/" + filename;
var options = {
    height: "800px",
    width: "100%",
    fallbackLink: "<p>This browser does not support inline PDFs: <a href='[url]'>Download " + filename + "</a></p>" 
};
PDFObject.embed(pdf_path, "#pdf_preview", options);
</script>