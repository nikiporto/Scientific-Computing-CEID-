m=2
n=8
A=[1 2 ; 8 2]
B=[5 7 ; 3 6]
C=[11 45 ; 6 7]

blkToeplitzTrid(m,n,B,A,C)   


function blkToeplitzTrid(m,n,B,A,C) 
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:28/11/21

d=zeros(m*n)
for i=1:n
  
     
     d(1+(i-1)*m:m+(i-1)*m,1+(i-1)*m:m+(i-1)*m)= A
     if (m+(i-1)*m+m )<=m*n
     d(1+(i-1)*m:m+(i-1)*m,1+(i-1)*m+m:m+(i-1)*m+m)= C
     end

     if (1+(i-1)*m-m)>=1
     d(1+(i-1)*m:m+(i-1)*m,1+(i-1)*m-m:m+(i-1)*m-m)= B
     end


end

end


