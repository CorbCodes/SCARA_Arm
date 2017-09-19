function fA = linePixelCords()

minX = 200;
maxX = 400;
minY = 200;
margin = 10;

x = [];
y = [];

rows = maxX-minX-margin*2;

for i = 1:1:rows
    
    x = vertcat(x, i + minX + margin);
    y = vertcat(y, minY + margin);
    
end

fA = [x,y];
end