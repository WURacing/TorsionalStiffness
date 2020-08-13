function FinalOutputUtil(FrameData,scaleFactor)

% Prints final facts, figures, values and writes TXT file for output to Solidworks

FrameData1 = GeometryAndLoadingForGeometryOptimizers_2019Frame(FrameData.A,FrameData.Coord);
TS1 = GetTorsionalStiffness(FrameData1);
FrameData2 = EngineSideGeometryAndLoadingForGeometryOptimizers_2019Frame(FrameData.A,FrameData.Coord);
TS2 = GetEngineSideTorsionalStiffness(FrameData2);

AvgTS = (TS1+TS2)/2;
W = GetWeight(FrameData);
Ratio = AvgTS/W;
[~,V,~] = DirectStiffnessSolver(FrameData1);
PlotDisplacement(FrameData1,V,scaleFactor,true,true)
[~,V,~] = DirectStiffnessSolver(FrameData2);
PlotDisplacement(FrameData2,V,scaleFactor,true,true)

fprintf("\n\n\nFINAL OUTPUT\n");
fprintf("Avg Torsional Stiffness:\t"+AvgTS+" N*m/deg\n");
fprintf("Associated Weight:\t\t"+W+" lbs\n");
fprintf("Ratio (TS/Weight):\t\t"+Ratio+"\n\n");

ExportTXTFile(FrameData.Coord);

end