function PlotDisplacement(D,U,Sc,plotDisplacement,plotTubeThicknesses)

%Arguments are Frame(D), Displacement(U) and Scale Factor(Sc)
U = U(1:3, :);
C=[D.Coord;D.Coord+Sc*U];
e=D.Con(1,:);
f=D.Con(2,:);

%Requires Thickness to Compare to
RD5x35 = .051129;   %1
R75x35 = .078618;   %2
R75x49 = .1079106;  %3
SQ7x35 = .0971857;  %4
RD1x35 = .106107;   %5
RD1x49 = .146395;   %6
SQ1x49 = .1806335;  %7
RD1x65 = .19093;    %8
RD1x95 = .270098;   %9
RD2xSD = 3.1415927; %10

%Initializes arrays of size equal to X. Comes from 2 nodes per joint and
%1 NaN per joint
X = NaN(D.m*2*1.5,6);
XT = NaN(D.m*2*1.5,42);

for i=1:6
    M=[C(i,e);C(i,f); NaN(size(e))];
    %Only the non-deformed plot is displayed by thickness so only 1:3 is needed.
    if i<4
        for j=1:D.m
            switch D.A(j)
                case RD5x35
                    XT(3*j-2:3*j,i)=M(:,j); 
                case R75x35
                    XT(3*j-2:3*j,i+3)=M(:,j);
                case R75x49
                    XT(3*j-2:3*j,i+6)=M(:,j);
                case SQ7x35
                    XT(3*j-2:3*j,i+9)=M(:,j);
                case RD1x35
                    XT(3*j-2:3*j,i+12)=M(:,j);      
                case RD1x49
                    XT(3*j-2:3*j,i+15)=M(:,j);
                case SQ1x49
                    XT(3*j-2:3*j,i+18)=M(:,j);
                case RD1x65
                    XT(3*j-2:3*j,i+21)=M(:,j);   
                case RD1x95
                    XT(3*j-2:3*j,i+24)=M(:,j);
                otherwise
                    XT(3*j-2:3*j,i+27)=M(:,j);
                
            end
        end
    end
    X(:,i)=M(:);
    
    
end

if plotDisplacement
    figure('Name','Deformed vs Non-Deformed');
    h1=plot3(X(:,1),X(:,2),X(:,3),'k.--',X(:,4),X(:,5),X(:,6),'r');
    axis('equal');
    set(h1, 'LineWidth',1);
    legend('Non-Deformed', 'Deformed','Location','southeast');
    title('Deformed vs Non-Deformed');
end

if plotTubeThicknesses
    figure('Name','Tube Thickness');
    h2=plot3(XT(:,1),XT(:,2),XT(:,3),'r',...
    XT(:,4),XT(:,5),XT(:,6),'m',...
    XT(:,7),XT(:,8),XT(:,9),'y',...
    XT(:,10),XT(:,11),XT(:,12),'c',...
    XT(:,13),XT(:,14),XT(:,15),'g-.',...
    XT(:,16),XT(:,17),XT(:,18),'g',...
    XT(:,19),XT(:,20),XT(:,21),'b-.',...
    XT(:,22),XT(:,23),XT(:,24),'b',...
    XT(:,25),XT(:,26),XT(:,27),'k',...
    XT(:,28),XT(:,29),XT(:,30),'k:');
    axis('equal');
    set(h2, 'LineWidth',2);
    title('Tube Thickness');
    legend('.5x.035','.75x.035','.75x.049',...
            'SQ.75x.035','1x.035',...
            '1x.049',...
            'SQ1x.049','1x.065',...
            '1x.095',...
            '2xSolid','Location','southeast');
end
    
end
