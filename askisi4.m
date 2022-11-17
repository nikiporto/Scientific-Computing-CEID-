val = [6 3 3 0  2  1  1  1  0  1  0  1  4  2  2  2  2 1 1 1]
bcol_ptr =[ 1  3  4  6]
brow_idx = [2  3  1  1  3]
nb=2
y=[1; 2 ;3 ; 4 ; 5 ; 6;]
x=[1; 2 ;3 ; 4 ; 5 ; 6;]

[y]=spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)


function[y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:5/12/21

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
