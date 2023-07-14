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

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/53a8980a-eb70-430e-adbc-f10bf94e7192) <img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/daddbd2e-188d-4a20-90f5-79c2ca4f5dac"> <img width="468" alt="image" src="https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/f9366eeb-6394-4f69-b32d-c2f38bfe20da">

### software programming 
As we explained in the previous part, to simulate the movement path of our robot, we used SPEL+ programming language which works based on the tool live sensoring tools of EPSON Software and we will check the results below.
It should also be noted that we Obtain results of trajectory in working space according for task2 to use live sensoring tools of EPSON Software.
We also display the displacement of the X, Y, Z axes relative to the time variable. 
![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/521f98d5-ba5e-48c0-98cf-a66b231b84ea)

We have written the MATLAB software codes for two sections Trajectory in Joint space and Trajectory in working space for task 2 which are referred to below and its results are reviewed and analyzed.
##### Trajectory in Joint space 
In this part, as in the previous task, we need to use line and parabola method which We have explained how it works to calculate Trajectory in Joint space.
Now in follow we compare and show the different parameters in joint space as the robot direction.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/0c7878fd-05bb-49d2-9bc4-0b83fdb7781d)
In the diagram shown above, the x-axis represents the time variable, and the y-axis represents the changes in the degree of angle Q1(Joint 1) with respect to time during the entire movement of the robot.
As the diagram shows For Q1, when our robot is at the first point (home position), our time is 0 and the angle degree is -35. Similarly, in the second, third, fourth to Eighth points, respectively, at times 6.5, 9 , 14 ,18 ,22 ,27 ,29 per seconds apart and the degrees of each of them are -6, -6, -55, -55,-1,-1,-55 respectively. And finally, which is our ninth point, as shown, the robot returns from the degree of movement at the same point of home position, which degree is -35 and in 34 seconds.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/c9a1718f-4151-4918-a86d-32e18611dc38)
In the diagram above shows, the x-axis represents time, and the first diagram shows the speed (y-axis) and the second diagram shows the acceleration (y-axis) in each of our displacement times.	
As the diagram above shows, there is the amount of speed and acceleration we need to do the displacement for Q1. At the first point of movement from 0 second to the end of movement at 34 second, the required speed and acceleration have been calculated for all 6 movement points of our robot.
As the diagram shows, in Q1, For the first point we need speed and acceleration 0.09 and 1.5 for displacements, and in the second point, we reach speed 0 and acceleration -1.2 in 6.5 seconds to continue moving. In the same way, we need to control the movement of the robot for the rest of the third to ninth points, where we finally reach the same point as the home position.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/5b20dd3a-32c3-4fe8-8c95-f70dce5bebde)
As the diagram shows For Q2, when our robot is at the first point (home position), our time is 0 and the angle degree is 83. Similarly, in the second, third, fourth to Eighth points, respectively, at times 6.5, 9 , 14 ,18 ,22 ,27 ,29 per seconds apart and the degrees of each of them are 88, 88, 51, 51,68 ,68 ,51 respectively. And finally, which is our ninth point, as shown, the robot returns from the degree of movement at the same point of home position, which degree is 83 and in 34 seconds.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/56636c32-3281-4bb0-93ba-6d022014ad9d)
As the diagram shows, in Q2, For the first point we need speed and acceleration 0.01 and 1.5 for displacements, and in the second point, we reach speed 0 and acceleration -1.2 in 6.5 seconds to continue moving. In the same way, we need to control the movement of the robot for the rest of the third to ninth points, where we finally reach the same point as the home position.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/e017a93f-5447-4d8e-96f5-0cc2c03dd635)
As the diagram shows For Q3, when our robot is at the first point (home position), our time is 0 and the angle degree is 0. Similarly, in the second, third, fourth to Eighth points, respectively, at times 6.5, 9 , 14 ,18 ,22 ,27 ,29 per seconds apart and the degrees of each of them are -580, -290, -580, -290,-580 ,-290 ,-400 respectively. And finally, which is our ninth point, as shown, the robot returns from the degree of movement at the same point of home position, which degree is 0 and in 34 seconds.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/752ca48e-62b2-4e66-b8e2-317e08c04c35)
As the diagram shows, in Q3, For the first point we need speed and acceleration 0 and -1.2 for displacements, and in the second point, we reach speed -2 and acceleration 0 in 6.5 seconds to continue moving. In the same way, we need to control the movement of the robot for the rest of the third to ninth points, where we finally reach the same point as the home position.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/7d7eafb5-b29c-4637-a67f-bf24362266d9)
As the diagram shows For Q4, when our robot is at the first point (home position), our time is 0 and the angle degree is 48. Similarly, in the second, third, fourth to Eighth points, respectively, at times 6.5, 9 , 14 ,18 ,22 ,27 ,29 per seconds apart and the degrees of each of them are 81, 81, -4, -4, 65, 65, -4, respectively. And finally, which is our ninth point, as shown, the robot returns from the degree of movement at the same point of home position, which degree is 48 and in 34 seconds.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/580342ee-330b-4b85-b725-469967cda79d)
As the diagram shows, in Q4, For the first point we need speed and acceleration 0.1 and 1.3 for displacements, and in the second point, we reach speed 0 and acceleration -1.2 in 6.5 seconds to continue moving. In the same way, we need to control the movement of the robot for the rest of the third to ninth points, where we finally reach the same point as the home position.


##### Trajectory in working space

we have used the modified trapezoidal motion curve method to obtain the results in this section, the description and operation of which have already been mentioned.
Here in follow we compare and show the different parameters in working space as the robot direction.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/64b16787-507d-4346-be47-59080dbf8599)
The above diagram shows the changes of the robot in the working space, where the x-axis represents time and the y-axis represents the displacement of the End Effector of our robot in the 3D space.
The diagram shows that at the first point of the x axis, the robot is at a position of 30 cm at 0 second. Similarly, it reaches 0 cm at the second point and its speed is 0 in this axis. And in the same way, in the third, fourth to ninth points, its changes and the necessary speed and acceleration and turques for each of the points are shown in the diagram.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/569e4a1f-70e7-4c3b-b1b8-631e7eef8ce0)
The diagram shows that at the first point of the y axis, the robot is at a position of 0 cm at 0 second. Similarly, it reaches 15 cm at the second point and its speed is 0 in this axis. And in the same way, in the third, fourth to ninth points, its changes and the necessary speed and acceleration and turques for each of the points are shown in the diagram.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/05f30a39-64cd-4957-9b36-fd84358158b3)
The diagram shows that at the first point of the z axis, the robot is at a position of 0 cm at 0 second. Similarly, it reaches -10 at the second point and its speed is 0 in this axis. And in the same way, in the third, fourth to ninth points, its changes and the necessary speed and acceleration and turques for each of the points are shown in the diagram.

![image](https://github.com/AbrahamR7/SCARA-Robot/assets/119547831/536991b2-6924-4822-a916-063562a4ba33)

