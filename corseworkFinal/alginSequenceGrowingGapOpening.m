function [ scores,alignment,scoreTable,gap] = alginSequenceGrowingGapOpening( sequence1 ,sequence2,gapPenalty,gapOpening )
    
    %value for opening a gap penelty
    %To Add differnt length strings 
    %Set 0 if can start string from new point
    
    [temp,s1]=size(sequence1);
    [temp,s2]=size(sequence2);
    s1=s1+1;
    s2=s2+1;
    %set all outer values on upper and left side values to = 0 as no gap
    %penalty as not started one chain yet
    for x = s1:-1:1
        for y = s2:-1:1
        scoreTable(x,y)= 0;
        gap(x,y)=1;
        end
    end
    
    
    %fill in center values for scoring 
    score=zeros(1,3);
    for x = 2:s1-1
       for y = 2:s2-1
           %get 3 possbile values
           if (gap(x-1,y)==1)
            score(1,1)=scoreTable(x-1,y)+(gapOpening);
            score(1,2)=scoreTable(x,y-1)+(gapOpening);
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(y-1))+scoreTable(x-1,y-1);
           else
            score(1,1)=scoreTable(x-1,y)+(gapPenalty*(gap(x-1,y)));
            score(1,2)=scoreTable(x,y-1)+(gapPenalty*(gap(x,y-1)));
            score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(y-1))+scoreTable(x-1,y-1);
           end
           
            [value,index]=max(score); %get highest value
            scoreTable(x,y)=value; 
            if (index==3)
                gap(x,y)=1;
            else
                if(index==1)
                    gap(x,y)=gap(x-1,y)+1;
                    gap(x,y)=gap(x,y-1)+1;
                end
            end
       end
    end
     
   %fill in right side of table
   for x = 2:s1-1
            %get posible values
            if (gap(x-1,y)~=1)
                score(1,1)=scoreTable(x-1,s2); %no gap penalty as get end of chain
                score(1,2)=scoreTable(x,s2-1)+(gapPenalty*(gap(x,s2-1)));
                score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(s2-1))+scoreTable(x-1,s2-1);
            else
                score(1,1)=scoreTable(x-1,s2); %no gap penalty as get end of chain
                score(1,2)=scoreTable(x,s2-1)+(gapOpening);
                score(1,3)=getBlosum62Score(sequence1(x-1),sequence2(s2-1))+scoreTable(x-1,s2-1);
            end
            [value,index]=max(score); %get highest
            scoreTable(x,s2)=value; 
            if (index==3)
                gap(x,s2)=1;
            else
                if(index==2)
                gap(x,s2)=gap(x-1,s2)+1;
                end
            end
   end
   %fill in bottom side table value
   for y = 2:s2-1
            %get posible values
            if (gap(x-1,y)~=1)
                score(1,1)=scoreTable(s1-1,y)+(gapPenalty*(gap(s1-1,y)));
                score(1,2)=scoreTable(s1,y-1);%no gap penalty as get end of chain
                score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(y-1))+scoreTable(s1-1,y-1);
            else
                score(1,1)=scoreTable(s1-1,y)+gapOpening;
                score(1,2)=scoreTable(s1,y-1);%no gap penalty as get end of chain
                score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(y-1))+scoreTable(s1-1,y-1);
            end
            [value,index]=max(score);%get highest
            scoreTable(s1,y)=value; 
            if (index==3)
                gap(s1,y)=1;
            else
                if(index==1)
                    gap(s1,y)=gap(s1-1,y)+1;
                end
            end
            scoreTable(s1,y)=value; 

   end
   
   %get value at bottom right of table
   score(1,1)=scoreTable(s1,s2-1);
   score(1,2)=scoreTable(s1-1,s2);
   score(1,3)=getBlosum62Score(sequence1(s1-1),sequence2(s2-1))+scoreTable(s1-1,s2-1);
   [value,index]=max(score);
   scoreTable(s1,s2)=value; 
    
   % do trace back on table
    alignment=traceBackOpening(scoreTable,sequence1,sequence2,gapPenalty,s1,s2,gap,gapOpening);
    % set score and alignment
    scores=scoreTable(s1,s2);
    alignment=char(alignment);
    
end

