### SCARA-Robot

##### Introduction

In this project, we had a mission to work with Robot Epson SCARA T3 and we supposed to develop MATLAB scripts and functions to study the kinematic and dynamic behaviour of this robot and perform two specific tasks. Epson SCARA T3 is A powerful four-axis robot with integrated controller and diverse connection possibilities, capable of payloads up to 3kg and a standard cycle time of 0.54 seconds. The Epson T3 series also supports image-processing, integration of external software and the option to design a custom user interface. It is used to manufacture various automotive parts including brakes, clutch components, ignition systems, instrument panels, headlights, mirrors, locks and more.

<img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/2dcc3a4c-cee8-4f9c-a3ae-c4795113a239">

### Requests
In task1 we supposed to Write the group’s letter (N) on a plane (XY) inscribed into a circle of diameter 150 mm using the “lines and parabula” method for trajectory planning. The movement should start from the home position outside the 150 mm diameter circle. 

<img width="356" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/f4c1ef56-2043-4659-a382-77b0e0f33cf3">

In task2 we have mission to Execute a pick and place task: start from home position (P0), reach pick position (P1), pick the object A and place A in position (P2); move to P3 the EE, pick object B and place this object in P4. Object B is placed on top on A. Return to the home position. Use the lines and parabula method for trajectory planning. 

<img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/190f9b81-60b3-41ed-89f7-065a42a6bce3">

##### software programming 

As the smart choice for robotic system development, Epson RC+ features the powerful SPEL+ programming language, 3D simulation software and more. It should be noted that we Obtain results of trajectory in working space according for task1 to use live sensoring tools of EPSON Software.
We also display the displacement of the X, Y, Z axes relative to the time variable.

##### MATLAB 
We have written the MATLAB software codes for two sections Trajectory in Joint space and Trajectory in working space for task 1 which are referred to below and its results are reviewed and analysed.
##### Trajectory in Joint space 
For calculating Trajectory in joint spaces, we use line and parabola method which is A line can meet a parabola in at most two points. If the discriminant of the resulting quadratic is negative, the line does not meet the parabola at all. If the discriminant of the resulting quadratic is positive, the line meets the parabola in two distinct points.
##### Trajectory in working space
calculating Trajectory in working space consists in finding a time series of successive joint angles that allows moving a robot from a starting configuration towards a goal configuration, in order to achieve a task, such as grabbing an object from a conveyor belt and placing it on a shelf.
Now we need to notify motion curves for calculate that which is A mechanical curve is a curve which cannot be constructed using a compass and straightedge. Note that while it is not possible to construct such a curve in this manner, it may well be possible to construct as many points on it as required.
Curve Shape
Circles
Ellipse
Sphere
For calculating Trajectory in working space we used modified trapezoidal motion curve method which is used When you use sinusoidal blender rather than the linear ones to remove discontinuities from the acceleration diagrams, we are faced with modified trapezoidal motion curves. 
• with equal ratio t0 /ta, the trapezoidal motion curves have a lower acceleration and jerk compared to the modified trapezoidal ones. 
• a higher jerk and acceleration at the beginning and at the end of the movement is well tolerated because it corresponds to a stronger alteration of the displacement that is simpler to obtain from a technical point of view (cams).
##### Dynamic Model 
The dynamics model reflects the mathematical relationship between the motion of the robot, the driving torque and load. This embodies the robot's athletic ability and carrying capacity from the side.
Robot dynamics is concerned with the relationship between the forces acting on a robot mechanism and the accelerations they produce. Typically, the robot mechanism is modelled as a rigid-body system, in which case robot dynamics is the application of rigid-body dynamics to robots.
One can distinguish between:
• Direct dynamic problem: computation of the robot movement under the action of the motor torques and applied forces. 
• Inverse dynamic problem: computation of the torque required by the motors in order to obtain a defined movement.
Direct dynamic problem → means differential equations solution, complex problem (it is used to simulate the dynamic behavior of a system) 
Inverse dynamic problem → means algebraic equations solution, simple to solve (“engineering problem”).

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/9d4aeb85-dccb-4a30-80a1-4a5c43b2b366)

Dynamic System Models generally represent systems that have internal dynamics or memory of past states such as integrators, delays, transfer functions, and state-space models. Most commands for analyzing linear systems, such as bode, margin, and linear System Analyzer, work on most Dynamic System Model objects.
For this project we create Extended coordinates vector from direct cinematic And also, from Extended coordinates vector we create Extended Jacobian matrix


### Task 2

##### Description

As we mentioned in the introduction, in task 2, we have mission to Execute a pick and place task: start from home position (P0), reach pick position (P1), pick the object A and place A in position (P2); move to P3 the EE, pick object B and place this object in P4. Object B is placed on top on A. Return to the home position. Use the lines and parabula method for trajectory planning. The simulation of the robot's movement path for task2 It is shown in the following section.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/53a8980a-eb70-430e-adbc-f10bf94e7192) <img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/daddbd2e-188d-4a20-90f5-79c2ca4f5dac">

