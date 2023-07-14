### SCARA-Robot

##### Introduction

In this project, we had a mission to work with Robot Epson SCARA T3 and we supposed to develop MATLAB scripts and functions to study the kinematic and dynamic behaviour of this robot and perform two specific tasks. Epson SCARA T3 is A powerful four-axis robot with integrated controller and diverse connection possibilities, capable of payloads up to 3kg and a standard cycle time of 0.54 seconds. The Epson T3 series also supports image-processing, integration of external software and the option to design a custom user interface. It is used to manufacture various automotive parts including brakes, clutch components, ignition systems, instrument panels, headlights, mirrors, locks and more.

<img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/2dcc3a4c-cee8-4f9c-a3ae-c4795113a239">

### Requests
In task1 we supposed to Write the group’s letter (N) on a plane (XY) inscribed into a circle of diameter 150 mm using the “lines and parabula” method for trajectory planning. The movement should start from the home position outside the 150 mm diameter circle. 
<img width="356" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/f4c1ef56-2043-4659-a382-77b0e0f33cf3">
In task2 we have mission to Execute a pick and place task: start from home position (P0), reach pick position (P1), pick the object A and place A in position (P2); move to P3 the EE, pick object B and place this object in P4. Object B is placed on top on A. Return to the home position. Use the lines and parabula method for trajectory planning. 

<img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/190f9b81-60b3-41ed-89f7-065a42a6bce3">

### Task 1

##### Description

The way the robot works in this part is that it starts moving from a point outside the main circle from the home position and enters the main circle and starts moving on the surface to complete the letters (N) inside the circle. slow and after completing it, it leaves the main circle again and returns to the home position. In the following, the simulation of the robot's movement path and the MATLAB software code and the desired results are reported.

##### software programming 

As the smart choice for robotic system development, Epson RC+ features the powerful SPEL+ programming language, 3D simulation software and more. It should be noted that we Obtain results of trajectory in working space according for task1 to use live sensoring tools of EPSON Software.
We also display the displacement of the X, Y, Z axes relative to the time variable.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/9da65723-628f-48ce-9b42-1e3979f4627f)

##### MATLAB 
We have written the MATLAB software codes for two sections Trajectory in Joint space and Trajectory in working space for task 1 which are referred to below and its results are reviewed and analysed.
##### Trajectory in Joint space 
For calculating Trajectory in joint spaces, we use line and parabola method which is A line can meet a parabola in at most two points. If the discriminant of the resulting quadratic is negative, the line does not meet the parabola at all. If the discriminant of the resulting quadratic is positive, the line meets the parabola in two distinct points.
Now in follow we compare and show the different parameters in joint space as the robot direction.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/fc6241b7-12bc-458d-8355-78899bbc5da9)
In the diagram shown above, the x-axis represents the time variable, and the y-axis represents the changes in the degree of angle Q1(Joint 1) with respect to time during the entire movement of the robot.
As the diagram shows For Q1, when our robot is at the first point (home position), our time is 0 and the angle degree is -55. Similarly, in the second, third, fourth and fifth points, respectively, at times 6.5, 8, 9.5 and 11 per seconds apart and the degrees of each of them are -35, 5, -22, and 8, respectively. And finally, which is our sixth point, as shown, the robot returns from the degree of movement at the same point of home position, which degree is -55 and in 22 seconds.


