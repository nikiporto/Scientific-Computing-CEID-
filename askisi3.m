A=[0 0 0 0 4 2;0 0 1 1 2 2;6 3 0 0 0 0;3 0 0 0 0 0;2 1 0 0 2 1;1 1 0 0 1 1]
nb=2
[val,brow_idx,bcol_ptr]=sp_mx2bccs(A,nb)

function [val,brow_idx,bcol_ptr]= sp_mx2bccs(A,nb)
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:3/12/21

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
      val= [val newval]
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