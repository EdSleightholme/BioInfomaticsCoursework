function [ score,alignment] = alginSequenceLocal( sequence1 ,sequence2 )
   
    gapPenalty=-8;
    
    %To Add differnt length strings 
    %Set 0 if can start string from new point

    [temp,s1]=size(sequence1);
    [temp,s2]=size(sequence2);
    s1=s1+1;
    s2=s2+1;
    answer=zeros(s1,s2);
    %set all outer values on upper and left side values to = 0 as no gap
    %penalty as not started one chain yet
    for x = 1:s1
        answer(x,1)= 0;
    end
    
    for y = 1:s2
        answer(1,y)=0;
    end
    
    %fill in center values for scoring 
    score=zeros(1,4);
    for x = 2:s1-1
       for y = 2:s2-1
           %get 4 possbile values
            score(1,1)=answer(x-1,y)+(gapPenalty);
            score(1,2)=answer(x,y-1)+(gapPenalty);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(y-1))+answer(x-1,y-1);
            score(1,4)=0;
            value=max(score); %get highest
            answer(x,y)=value; 
       end
    end
     
   %fill in right side of table
   for x = 2:s1-1
            %get posible values
            score(1,1)=answer(x-1,s2); %no gap penalty as get end of chain
            score(1,2)=answer(x,s2-1)+(gapPenalty);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(s2-1))+answer(x-1,s2-1);
            score(1,4)=0;
            value=max(score); %get highest
            answer(x,s2)=value; 
   end
   %fill in bottom values
   for y = 2:s2-1
            %get posible values
            score(1,1)=answer(s1-1,y)+(gapPenalty);
            score(1,2)=answer(s1,y-1);%no gap penalty as get end of chain
            score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(y-1))+answer(s1-1,y-1);
            score(1,4)=0;
            value=max(score);%get highest
            answer(s1,y)=value; 
   end
   
   %get value at bottom right of table
   score(1,1)=answer(s1,s2-1);
   score(1,2)=answer(s1-1,s2);
   score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(s2-1))+answer(s1-1,s2-1);
   score(1,4)=0;
   value=max(score);
   answer(s1,s2)=value; 
   %finds position of highest scoring cell
   [maxvalue,I] = max(answer(:));
   [I_row, I_col] = ind2sub(size(answer),I);
   
   % do trace back on table
    alignment=tracebackLocal(answer,sequence1,sequence2,gapPenalty,I_row,I_col);
    % set score and alignment
    score=maxvalue;
    alignment=char(alignment);
    
end



