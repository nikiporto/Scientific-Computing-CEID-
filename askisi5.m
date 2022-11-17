
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:15/12/21
nb=m
n=64
y=eye(n*m,1)
x=ones(n*m,1)
T=toeplitz([4,-1,zeros(1,m-2)])
A=inv(T)
B=T^2
%S=blkToeplitzTrid(32,64,A,B,T)
%[val,brow_idx,bcol_ptr]= sp_mx2bccs(S,nb)
%[y]=spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)
%l2y = sqrt(sum(abs(y).^2))
%y1=y+S*x
%l2y1 = sqrt(sum(abs(y1).^2))
%error=y1-y


function [d]=blkToeplitzTrid(m,n,B,A,C) 
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:28/11/12

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
function[y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:5/12/12

y_dot= zeros(size(y,1),1)

C = reshape(val,nb,nb,length(val)/(nb*nb))

d=diff(bcol_ptr)

index=1
col=0
for i= 1:length(d)
    k=d(i)
    for j=1:k
    block=C(:,:,index)
    row=brow_idx(index)
    
    y_dot(nb*row-1:(row)*nb,1)=y_dot(nb*row-1:(row)*nb,1)+block*x(nb*col+1:(col+1)*nb,1)
    
    index=index+1
    end
    col=col+1
end

y=y+y_dot
end

function [val,brow_idx,bcol_ptr]=sp_mx2bccs(A,nb)
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:3/11/12

val=[]
brow_idx=[]
d=[]
z=(ones(1,size(A,2)/nb))*nb

c = mat2cell(A, [ z ],[ z])
celldisp(c)

count=0
for j=1:size(A,2)/nb
 for i=1:size(A,2)/nb
 
    if  sum(abs(c{i,j}(:)~=0))
      newval=(c{i,j}(:).')
      val = [val newval];
      brow_idx=[brow_idx i]
      d=[d j]      
      count=count+1
    end
  end
end
n=diff(d)
answer=find(n)+1
bcol_ptr=[1 answer count+1]

end