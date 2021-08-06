---
layout: post
title: "Localizing a Differential-Drive Robot with an Unscented Kalman Filter (UKF)"
description: "Autonomous Robot Navigation [E160] - Final Project"
published: true
tags: [projects]
---

<!-- <h1 align="center">Localizing a Differential-Drive Robot with an Unscented Kalman Filter (UKF)</h1> -->
<!-- <h2 align="center">Autonomous Robot Navigation (E160) Final Project</h2>
<h3 align="center"> Eyassu Shimelis and Sean Mahre </h3> -->

<h2>Background</h2>
<p>The Kalman Filter (KF) is a filtering and prediction technique for
    continuous systems; however, it is only limited to linear Gaussian
    systems. In order for the Kalman filter to be correct, its derivation
    relies on linear transformations. One method of applying this filter to
    nonlinear systems is to instead use a first-order Taylor series estimate.
    In a previous lab, we implemented a particle filter, which can be used to
    approximate most distributions with enough particles; however, particle
    filters are computationally expensive. The benefit of the Kalman filter
    is its closed form solution, making a very fast technique for Gaussian systems
    The unscented Kalman filter (also known as sigma-point belief propagation)
    is another method of linearizing nonlinear systems, for use in Kalman filtering.
    Instead of linearizing a system, like the EKF, the UKF propogates sigma points
    through the non-linear transformation. Sigma points are located at the mean and
    symmetrically along the main axes of the covariance.
</p>

<p>Link to the final presentation: <a href="https://docs.google.com/presentation/d/1-C9s5yihTRWvIDMOfT9dZc8EY41FBMYsYPX167Xb2Rc/edit?usp=sharing"> E160 UKF Final Presentation</a> </p>

<h2>Project Definition</h2>
Localize a differential drive robot in a known map, using an algorithm more
accurate than an extended Kalman filter and more efficient than a particle filter.

<h2>Materials</h2>
The robot used in this report is a small, two-pound differential drive robot,
shown in the figure below. The diameter of each wheel is 6.95 cm +/- 0.01
 and the distance between the center of the two wheels is 14.15 cm +/- 0.01.
 Each wheel also has an encoder that is capable of measuring the relative
 rotation of each wheel with a resolution of 4.36*10^{-3} rad/tick.

<figure>
<img src="{% asset 'documentation/e160/chassis.png' @path %}" alt="The E160 differential drive robot" style="width: 500px; margin-left: auto; margin-right: auto"/>
<figcaption> The E160 differential drive robot </figcaption>
</figure>

<h2>Map</h2>
The particle filter was tested in simple hallway. The hallway has a footprint
of approximately 4 meters by 4 meters, the specific measurements
are shown in the figure below. To overcome the sensor's limited range, the
robot's trajectory was place next to the walls.

<figure>
<img src="{% asset 'documentation/e160/map.png' @path %}" alt="Overhead map of the hallway" style="width: 500px; margin-left: auto; margin-right: auto"/>
<figcaption> Overhead map of the hallway </figcaption>
</figure>

<h2>UKF Pseudocode</h2>
The following UKF pseudocode is from Chapter 4 of Sebastian Thrun's text: Probabilistic Robotics.<br>

<figure>
<img src="{% asset 'documentation/e160/UKFPseudocode.png' @path %}" alt="UKF Pseudocode" style="width: 500px; margin-left: auto; margin-right: auto"/>
<figcaption> Unscented Kalman Filter algorithm, from Sebastian Thrun's testbook </figcaption>
</figure>

<h2>UKF State Design</h2>
The UKF state consisted of three variables: the two dimensional position (x,y) and the robot's heading (theta). <br>
<figure>
<img src="{% asset 'documentation/e160/ukfstate.png' @path %}" alt="UKF State" style="width: 100px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<figure>
<img src="{% asset 'documentation/e160/ukfcovariance.png' @path %}" alt="UKF Covariance" style="width: 250px; margin-left: auto; margin-right: auto"/>
<figcaption> Representation of distribution as a Gaussian, with a mean and covariance </figcaption>
</figure>


<h2>Experiment 1 - Convergence</h2>
<p> This experiment looked at convergence rates for different types of initial disturbances.
<h2 align="center">Simulation</h2>
<p>Theta-offset: Converged 4/5 times</p>
<p>XY-offset: Converged 5/5 times</p><br>
<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/DtFZNy1HP_M" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
</div>
<figure>
<img src="{% asset 'documentation/e160/UKFSimConvergenceError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<h2>Experiment 2 - Passive Tracking</h2>
<h2>[Simulation]</h2>
<p>RMSE: 0.0331 m</p>

<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/eIip8V51J2c" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
</div>

<figure>
<img src="{% asset 'documentation/e160/UKFSimPassive.png' @path %}" alt="UKF Covariance" style="width: 1000px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
<figure>
<img src="{% asset 'documentation/e160/UKFSimPassiveError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<h2>[Hardware]</h2>
<p>RMSE: 0.1841 m</p>

<figure>
<img src="{% asset 'documentation/e160/UKFHardwarePassive.png' @path %}" alt="UKF Covariance" style="width: 1000px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
<figure>
<img src="{% asset 'documentation/e160/UKFHardwarePassiveError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<h2>Experiment 3 - Feedback Control</h2>
<h2>[Simulation]</h2>
<p>RMSE: 0.0389 m</p>

<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/KkzKvl0QoRs" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
</div>

<figure>
<img src="{% asset 'documentation/e160/UKFSimFeedbackTest.png' @path %}" alt="UKF Covariance" style="width: 1000px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
<figure>
<img src="{% asset 'documentation/e160/UKFSimFeedbackTestError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<h2>[Hardware]</h2>
<p>RMSE: 0.1914 m</p>

<figure>
<img src="{% asset 'documentation/e160/UKFHardwareFeedback.png' @path %}" alt="UKF Covariance" style="width: 1000px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
<figure>
<img src="{% asset 'documentation/e160/UKFHardwarePositionError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>

<h2>Experiment 4 - UKF and Particle Filter Comparison</h2>
<h2>Simulation</h2>
<p>UKF RMSE: 0.0496 m</p>
<p>Particle Filter RMSE: 0.0183 m</p>

<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/cGWNfols4lc" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
</div>

<figure>
<img src="{% asset 'documentation/e160/UKFvsPF.png' @path %}" alt="UKF Covariance" style="width: 1000px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
<figure>
<img src="{% asset 'documentation/e160/UKFvsPFError.png' @path %}" alt="UKF Covariance" style="width: 700px; margin-left: auto; margin-right: auto"/>
<figcaption> </figcaption>
</figure>
