%Running this script deletes the specified nodes and all corresponding
%members in the node matrix (Coord), connectivity matrix (Con), degree of
%freedom matrix(Re), and node load matrix (Load).
%You must manually delete the corresponding tube thicknesses in A.
%

%Read excel files into matlab -- in GeometryAndLoading, read in matrices
%from Excel.
nodesMatrix=readmatrix('NodeMatrix.xlsx')
connectivityMatrix = readmatrix('ConnectivityMatrix.xlsx')
degreeofFreedomMatrix = readmatrix('DegreeOfFreedomMatrix_ForEdits.xlsx')
nodeLoadMatrix = readmatrix('NodeLoadMatrix_ForEdits.xlsx')

%Deleting nodes    
deleteNodeNumber=13;                %explicitly define the node number you want to delete
editNodesMatrix = nodesMatrix       %placeholders ig, should probably be used to check against original  
editConnectivityMatrix=connectivityMatrix

editNodesMatrix(deleteNodeNumber,:)=[]      %deleting the specific node from node matrix

%delete corresponding nodes in nodeload and degofFreedom matrices
degreeofFreedomMatrix(deleteNodeNumber, :) = []
nodeLoadMatrix(deleteNodeNumber,:)=[]

%delete all rows in connectivity matrix that contain the deleted node
%number
editConnectivityMatrix(editConnectivityMatrix(:,1)==deleteNodeNumber, :)=[]
editConnectivityMatrix(editConnectivityMatrix(:,2)==deleteNodeNumber, :)=[]

%shifts all the node numbers up accordingly
nodeDeletion = zeros(size(editConnectivityMatrix,1), size(editConnectivityMatrix,2))

for i=1:size(editConnectivityMatrix,1)
    if editConnectivityMatrix(i,1)>deleteNodeNumber
        nodeDeletion(i,1) = 1
    end
    if editConnectivityMatrix(i,2)>deleteNodeNumber
        nodeDeletion(i,2) = 1
    end
end

editConnectivityMatrix = editConnectivityMatrix - nodeDeletion

%overwrites original Excel files -- usually use this for prelimnary testing,
%when you are actually testing, save each trial as a different excel file
recycle on
delete('NodeMatrix.xlsx')
delete('ConnectivityMatrix.xlsx')
delete('DegreeOfFreedomMatrix_ForEdits.xlsx')
delete('NodeLoadMatrix_ForEdits.xlsx')
xlswrite('NodeMatrix.xlsx', editNodesMatrix)
xlswrite('ConnectivityMatrix.xlsx', editConnectivityMatrix)
xlswrite('DegreeOfFreedomMatrix_ForEdits.xlsx', degreeofFreedomMatrix)
xlswrite('NodeLoadMatrix_ForEdits.xlsx',nodeLoadMatrix)












    