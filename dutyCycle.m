function fA = dutyCycle(x)% 'x' represents angle (degrees)

%Remember this equation was made from 'calibrated' values
%So we might need to re-calibrate the device for the final assessment
leftMotor = -10.73 * x + 2597.03;
rightMotor = -9.92 * x + 2055.136;

fA = [leftMotor, rightMotor];
%(x - 96) * -10.526 +1100; %(My duty cycle)

end