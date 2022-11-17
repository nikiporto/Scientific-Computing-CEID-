A=[0.3984 0.1895 0.8423 0.0000;0.0000 0.5458 0.0000 0.0000;0.9416 0.4122 0.1788 0.0000;0.0000 0.0000 0.7134 0.0000]

spmat2latex (A,'csc')

function [val,JA,IA]=spmat2latex(A,sp_type)
%Author: а.поятойакоцкоу , ал:1067539 ,DATE:20/11/21 
if sp_type == 'csr' 
  val= (nonzeros(A.')).'
  [IA, col_ip]=find( A.' ) 
  IA=IA.'
  dCid=diff(col_ip)
  answer=find(dCid)+1
  JA=[1 answer.' length(val)+1]
  disp(['$$ val= \begin { tabular } {',repmat('|1',1,length(val)), '|}\ hline', num2str(val),'\\ \hline \end { tabular } $$'])
  disp(['$$ JA= \begin { tabular} {',repmat('|1',1,length(JA)), '|}\ hline', num2str(JA),'\\ \hline \end { tabular } $$']) 
  disp(['$$ IA= \begin { tabular } {',repmat('|1',1,length(IA)), '|}\ hline', num2str(IA),'\\ \hline \end { tabular } $$'])
 
else 
  val= (nonzeros(A)).'  
  [IA, cId]=find( A) 
  dCid=diff(cId.')
  answer=find(dCid)+1
  JA=[1 answer length(val)+1]
  val= (nonzeros(A)).'  
  disp(['$$ val= \begin { tabular } {',repmat('|1',1,length(val)), '|}\ hline', num2str(val),'\\ \hline \end { tabular } $$'])
  disp(['$$ JA= \begin { tabular} {',repmat('|1',1,length(JA)), '|}\ hline', num2str(JA),'\\ \hline \end { tabular } $$']) 
  disp(['$$ IA= \begin { tabular } {',repmat('|1',1,length(IA)), '|}\ hline', num2str(IA.'),'\\ \hline \end { tabular } $$'])
 end
end