pixelCords = linePixelCords(); % Returns an array of (x,y) pixel cords 

%Sets the variables rows and cols to 
%define the size of the array
[rows,cols] = size(pixelCords);

%Creates a new array to store the PWM Angles.
pwmAngles = zeros(rows,3);

%values for writing/moving without writing
penDown = 1500;
penUp = 1400;
penPosition = penDown;

x = [];
y = [];
p = [];

for i = 1:1:rows
   
    %Gets x and y pixel cords from array
    xCord = pixelCords(i,1);
    yCord = pixelCords(i,2);
    %Converts pixel cords left & right motor angles.
    angles = findAngles(xCord,yCord); % @returns 1D array with left and right motor angle
    %Converts Motor angles to PWM values
    pwnValues = dutyCycle(angles);
    pwnLeft =  pwnValues(1);
    pwnRight = pwnValues(2);
   
    %Rounds values to ints
    int16(pwnLeft);
    int16(pwnRight);
    
    penPosition = penDown;
    
    x = vertcat(x,pwnLeft); % Left Motor (pwn value)
    y = vertcat(y,pwnRight); % Right Motor (pwn value)
    p = vertcat(p,penPosition); % Pen Position 
end

pc(1) = penUp; %% First movement the pen is up as its moving to the starting position.
pc(2) = penDown; %% Pen down starts to draw
pc(rows) = penUp; %% Pen up as its finished drawing

fA = [x,y,p];

%Exports PWM values to txt file to test
dlmwrite('line_pwm_values.txt',fA);

%Notes:
%Still need to handle singularitys, before testing.