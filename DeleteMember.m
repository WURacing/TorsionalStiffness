%Running this script deletes the specified nodes and all corresponding
%members in the node matrix (Coord), connectivity matrix (Con), degree of
%freedom matrix(Re), and node load matrix (Load).
%You must manually delete the corresponding tube thicknesses in A.
%

%Read excel files into matlab -- in GeometryAndLoading, read in matrices
%from Excel.
connectivityMatrix = readmatrix('ConnectivityMatrix.xlsx')

%Deleting nodes    
deleteMemberNumber=44;                %explicitly define the member number you want to delete

%delete corresponding nodes in nodeload and degofFreedom matrices
connectivityMatrix(deleteMemberNumber, :)=[]


%overwrites original Excel files -- usually use this for prelimnary testing,
%when you are actually testing, save each trial as a different excel file
recycle on
delete('ConnectivityMatrix.xlsx')
xlswrite('ConnectivityMatrix.xlsx', connectivityMatrix)