function [ score,alignment,scoreTable] = basicAlginSequence( sequence1 ,sequence2,gapPenalty )

   
    
    
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
        try
            scoreTable(x,1)= scoreTable(x-1,1)+gapPenalty;
        catch
            scoreTable(x,1)= 0;
        end
    end
    
    for y = 1:s2
         try
            scoreTable(1,y)= scoreTable(1,y-1)+gapPenalty;
        catch
            scoreTable(1,y)= 0;
        end
    end
    
    %fill in center values for scoring 
    score=zeros(1,3);
    for x = 2:s1
       for y = 2:s2
           %get 3 possbile values
            score(1,1)=scoreTable(x-1,y)+(gapPenalty);
            score(1,2)=scoreTable(x,y-1)+(gapPenalty);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(y-1))+scoreTable(x-1,y-1);
            value=max(score); %get highest
            scoreTable(x,y)=value; 
       end
    end

  
    
    %do trace back on table to get alignment
    alignment=basicTraceBack(scoreTable,sequence1,sequence2,gapPenalty,s1,s2);
    % set best score and alignment
    score=scoreTable(s1,s2);
    alignment=char(alignment);
    
end






