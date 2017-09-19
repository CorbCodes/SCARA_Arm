function fA = findAngles(xT, yT)
    
    xm1 = 256.0;
    ym1 = 478.0;
    xm2 = 407.0;
    ym2 = 478.0;

    R = 256.65;
    
    xA1 = xT + (xm1 - xT)/2;
    yA1 = yT + (ym1 - yT)/2;
    xA2 = xT + (xm2 - xT)/2;
    yA2 = yT + (ym2 - yT)/2;
    
    h1 = sqrt(R^2 - ((yA1-yT)^2) + (xA1-xT)^2);
    h2 = sqrt(R^2 - ((yA2-yT)^2) + (xA2-xT)^2);
    
    alpha1 = atan((ym1 - yT)/(xm1-xT));
    alpha2 = atan((ym2 - yT)/(xm2-xT));
    
    angleA1 = pi/2 - alpha1;
    angleA2 = pi/2 - alpha2;
    
    xj11 = xA1 + h1*cos(angleA1);
    yj11 = yA1 - h1*sin(angleA1);
    
    xj12 = xA1 - h1*cos(angleA1);
    yj12 = yA1 + h1*sin(angleA1);
    
    xj21 = xA2 + h2*cos(angleA2);
    yj21 = yA2 - h2*sin(angleA2);
    
    xj22 = xA2 - h2*cos(angleA2);
    yj22 = yA2 + h2*sin(angleA2);
    
    angle11 = atan2(yj11 - ym1, xj11 - xm1);
    angle12 = atan2(yj12 - ym1, xj12 - xm1);
    
    angle21 = atan2(yj21 - ym2, xj21 - xm2);
    angle22 = atan2(yj22 - ym2, xj22 - xm2);
    
    
    angleSets = [-angle11 -angle21;
                 -angle11 -angle22;
                 -angle12 -angle21;
                 -angle12 -angle22];
      
    %fA = angleSets;
    
    %Converts angles to degrees:
    angle21 = angle21 * 180/pi *-1;
    angle22 = angle22 * 180/pi *-1;
    
    % @returns angles of motors left,right in degrees
    fA = [angle21,angle22]; 
    
end