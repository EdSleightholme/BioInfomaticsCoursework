function [ score,alignment,scoreTable] = alginSequence( sequence1 ,sequence2,gapPenalty )
   
    
    
    %To Add differnt length strings 
    %Set 0 if can start string from new point
   
    %Get length of sequences +1 as that is size of scoreing table
    [temp,s1]=size(sequence1);
    [temp,s2]=size(sequence2);
    s1=s1+1;
    s2=s2+1;
    %Set size of scoreing table
    scoreTable=zeros(s1,s2);
    
    %set all outer values on upper row and left side colum values to = 0 as no gap
    %penalty as not started chain yet
    for x = 1:s1
        scoreTable(x,1)= 0;
    end
    
    for y = 1:s2
        scoreTable(1,y)=0;
    end
    
    %fill in center values for scoring 
    score=zeros(1,3);
    for x = 2:s1-1
       for y = 2:s2-1
           %get 3 possbile values
            score(1,1)=scoreTable(x-1,y)+(gapPenalty);
            score(1,2)=scoreTable(x,y-1)+(gapPenalty);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(y-1))+scoreTable(x-1,y-1);
            value=max(score); %get highest
            scoreTable(x,y)=value; 
       end
    end
     
   %fill in right side colum of table
   for x = 2:s1-1
            %get posible values
            score(1,1)=scoreTable(x-1,s2); %no gap penalty as get end of chain
            score(1,2)=scoreTable(x,s2-1)+(gapPenalty);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(s2-1))+scoreTable(x-1,s2-1);
            value=max(score); %get highest
            scoreTable(x,s2)=value; 
   end
   
   %fill in row bottom values
   for y = 2:s2-1
            %get posible values
            score(1,1)=scoreTable(s1-1,y)+(gapPenalty);
            score(1,2)=scoreTable(s1,y-1);%no gap penalty as get end of chain
            score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(y-1))+scoreTable(s1-1,y-1);
            value=max(score);%get highest
            scoreTable(s1,y)=value; 
   end
   
   %get value at bottom right of table
   score(1,1)=scoreTable(s1,s2-1);
   score(1,2)=scoreTable(s1-1,s2);
   score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(s2-1))+scoreTable(s1-1,s2-1);
   value=max(score);%get highest
   scoreTable(s1,s2)=value; 
   % do trace back on table to get alignment
    alignment=traceBack(scoreTable,sequence1,sequence2,gapPenalty,s1,s2);
    % set best score and alignment
    score=value;
    alignment=char(alignment);
    
end

