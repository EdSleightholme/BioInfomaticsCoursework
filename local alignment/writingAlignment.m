function [alignment] = writingAlignment(x,y,sequence1,sequence2,gap,finalMatrix)

  output=zeros(1,2);
  output(1,1)=x
  output(1,2)=y
  
   if(x~=1 && y~=1)
    alignment=zeros(3,1);
    getScore=getBlosum62Score(sequence1(x-1),sequence1(y-1));
    if(finalMatrix(x-1,y)==(finalMatrix(x,y)-gap) )
      
       alignment =writingAlignment(x-1,y,sequence1,sequence2,gap,finalMatrix);
       toAdd=zeros(3,1);
       toAdd(1,1)=sequence1(x);
       toAdd(2,1)='';
       toAdd(3,1)='-';
      alignment = [alignment,toAdd]
       %append final string
    end
    if(finalMatrix(x,y-1)==(finalMatrix(x,y)-gap) )
       alignment=writingAlignment(x,y-1,sequence1,sequence2,gap,finalMatrix);
       toAdd=zeros(3,1);
       toAdd(1,1)='-';
       toAdd(2,1)='';
       toAdd(3,1)=sequence2(y);
       alignment = [alignment,toAdd]
       
    end
    if(finalMatrix(x-1,y-1)==(finalMatrix(x,y)-getScore))
      
       alignment=writingAlignment(x-1,y-1,sequence1,sequence2,gap,finalMatrix);
       toAdd=zeros(3,1);
       toAdd(1,1)=sequence1(x);
       toAdd(2,1)='|';
       toAdd(3,1)=sequence2(y);
       alignment = [alignment,toAdd]
    end
   else
        
       if (x==1 && y~=1)
           alignment=zeros(3,1);
           toAdd=zeros(3,y);
           for temp=y:-1:1
           toAdd(1,temp)='-';
           toAdd(2,temp)='';
           toAdd(3,temp)=sequence2(temp);
           end
           alignment = [alignment,toAdd]
       end
       if (y==1 && x~=1)
           alignment=zeros(3,1);
           toAdd=zeros(3,x);
           for temp=y:-1:1
           toAdd(1,temp)=sequence1(temp);
           toAdd(2,temp)='';
           toAdd(3,temp)='-';
           end
           alignment = [alignment,toAdd]
       end
       if (y==1 && x==1)
           alignment=zeros(3,1);
           toAdd=zeros(3,1);
           
           toAdd(1,1)=sequence1(1);
           toAdd(2,1)='|';
           toAdd(3,1)=sequence2(1);
           alignment = [alignment,toAdd]
       end
   end
end

