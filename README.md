# smart_parkinglot_management
A smart parking lot management system using Arduino Uno and Matlab

Components used :
1) Arduino Uno
2) Servo motor
3) LEDs - RED and GREEN
4) Potentiometer
5) LCD 16x2
6) Push Buttons
7) wires, breadboard and USB connector for arduino 


The Design and implementation of a parking control system using Arduino uno board to do the following tasks:

1.	When there are empty spots in the parking, the total number of available parking spots and a “Welcome!!!” message have to be displayed on an LCD indicator. The parking barrier arm has to be in the closed position with a RED traffic light on. For a car to enter the parking, the driver has to press the Enter button to open the gate barrier. Once the gate is open, the RED traffic light changes GREEN to allow the car to enter. After the car is parked, the barrier arm closes, the traffic light turns to RED again and the number of available parking spots is reduced by one. 

2.	For a car to exit the parking, the driver has to press the Exit button. The barrier arm opens and the traffic light turns from RED to GREEN.  Once the car leaves the parking, the barrier bar closes again, the traffic light turns to RED and the number of available parking spots displayed on the LCD increases by one. 

3.	It is assumed that the capacity of the parking lot is 13 spots. When the parking is full, the message on the LCD has to change from “Welcome!!!”  to “Plz come later.” with the available parking spots of 0. In this case, the barrier bar should not open if a driver tries to enter the parking by pressing the Enter button.




TEST CASES:
The implemented project will be fully tested to ensure that the project objectives are met. A sample test may include the following steps.
1.	When the parking lot is empty, 6 cars enter the parking lot sequentially. 
2.	1 car leaves the parking lot. 
3.	8 cars enter the parking lot sequentially. 
4.	1 car enters the parking lot. 
5.	1 car leaves the parking lot. 
6.	1 car enters the parking lot. 
