% =========================================================
% Project: Smart Parking Management System
% Author: Sri Tharun Krishnamoorthy
%
% Date: 30-3-2023
% Time: 10pm
% Desc.: A smart technology that helps and manages car 
%   traffic while parked. In the actual world, if we need 
%   to park, we must first seek a parking place by driving 
%   around the parking lot. Because the system is aware of 
%   all available slots, it directs the user to the 
%   designated parking place. If no slots are available, 
%   the user will be notified.
% =========================================================


%clear screen
clc
close all;
% clear existing memory
clear all; 

%Initializing Arduino board
a = arduino('COM7', 'Uno', 'Libraries', {'Servo', 'ExampleLCD/LCDAddon'});

%display message in command window to confirm arduino connection 
display ("Arduino Connected");


%create variable 'display' and configuring the LCD screen to the Arduino
%Here,ExampleLCD/LCDAddon - specifies the name of the addon and the directory where it's located.
display=addon(a,'ExampleLCD/LCDAddon','RegisterSelectPin','D3','EnablePin','D4','DataPins',{ 'D5','D6','D7','D8'});
initializeLCD(display); 



% Constants 
RED = 'D12'; %configuring RED LED to D12 pin of arduino
GREEN = 'D8'; %configuring RED LED to D12 pin of arduino
ON = 1; %configuring state of LEDs-> High means 1 
OFF = 0; %configuring state of LEDs-> Low means 0
vacantSpaces = 13; % declaring total vacantSpace is 13

% Servo Object
gate = servo(a,"D10"); %configuring servo motor as gate/barrier at D10 pin of arduino
writePosition(gate,0); %initializing gate/barrier position to 0 (horizontal closed position)

printLCD(display,'Welcome!!'); % displayin the msg on LCD
printLCD(display,strcat('Slots Left:',num2str(vacantSpaces))); %strcat - concatenation of string characters, num2str - converting numerical characters to string characters




% while loop
while true 

    % Entry and Exit buttons
    enter = readVoltage(a,'A1'); % configuring entry button at A1 pin of arduino 
    exit = readVoltage(a,'A2'); % configuring exit button at A2 pin of arduino 

    writeDigitalPin(a,RED,ON); % turning ON RED LED
    writeDigitalPin(a,GREEN,OFF); % turning OFF GREEN LED

    % 4 since when the wire is closed for push button, reading is HIGH - 5V connected to arduino 
    if enter >= 4 
        if vacantSpaces > 0 
            writeDigitalPin(a,RED,OFF); % turning OFF RED LED
            writeDigitalPin(a,GREEN,ON); % turning ON GREEN LED
            writePosition(gate,0.5); %initializing gate/barrier position to 1 (vertical closed position)
            vacantSpaces = vacantSpaces - 1; % decrementing vacantspace to -1
            printLCD(display,'Welcome!!'); 
            printLCD(display,strcat('Slots Left:',num2str(vacantSpaces))); 

            pause(5); %wait 5 secs for car to pass through

            writePosition(gate,0); %initializing gate/barrier position to 0 (horizontal closed position)
            pause(1);%wait 1 sec
            writeDigitalPin(a,RED,ON); % turning ON RED LED
            writeDigitalPin(a,GREEN,OFF); % turning OFF GREEN LED
        else 
            printLCD(display,'PleaseComeLater'); % display msg on LCD
            printLCD(display,strcat('Slots Left:',num2str(vacantSpaces))); 
        end

    % 4 since when the wire is closed for push button, reading is HIGH - 5V connected to arduino
    elseif exit >= 4
        if vacantSpaces < 13
            writeDigitalPin(a,RED,OFF); % turning OFF RED LED
            writeDigitalPin(a,GREEN,ON); % turning ON GREEN LED
            writePosition(gate,0.5); %initializing gate/barrier position to 1 (vertical closed position)
            vacantSpaces = vacantSpaces + 1; % incrementing vacantspace to +1
            printLCD(display,'Welcome!!'); % display msg on LCD
            printLCD(display,strcat('Slots Left:',num2str(vacantSpaces))); 

            pause(5); %wait 5 secs for car to pass through

            writePosition(gate,0); %initializing gate/barrier position to 0 (horizontal closed position)
            pause(1); %wait 1 sec
            writeDigitalPin(a,RED,ON); % turning ON RED LED
            writeDigitalPin(a,GREEN,OFF); % turning OFF GREEN LED
        else 
            printLCD(display,'No Vehicle!!'); % display msg on LCD
            printLCD(display,strcat('Slots Left:',num2str(vacantSpaces)));
        end
    end

end
