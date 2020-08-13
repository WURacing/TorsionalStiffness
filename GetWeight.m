function FrameWeight = GetWeight(FrameData)

mass = 0;
RD1xSD = .785398;
RD2xSD = 3.1415927;
nodes = FrameData.Con(1:2,:);
for i=1:length(FrameData.Con)
    if FrameData.A(i) ~= RD1xSD && FrameData.A(i) ~= RD2xSD
        firstNode = FrameData.Coord(:,nodes(1,i));
        secondNode = FrameData.Coord(:,nodes(2,i));
        diff = firstNode-secondNode;
        squared = diff.^2;
        addedUp = sum(squared);
        distance = sqrt(addedUp);
        
        volume = distance*FrameData.A(i);
        density = 0.284;    % pounds/inch^3
        
        mass = mass + (volume*density);
    end
end

FrameWeight = mass;