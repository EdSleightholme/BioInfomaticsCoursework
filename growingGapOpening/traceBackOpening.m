function [ alginment,fin ] = traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1,pos2,gap,gapOpen)
    alginment=zeros(3,1);
    fin=false;
    [s1,s2] = size(scoreMatrix);
    %line 9-61
    %try possbile values
    %if find possbile move run trace back from next postion 
    %on call back up add to alignment
    try    
        if (gap(pos1-1,pos2)==1)
            if((scoreMatrix(pos1-1,pos2)+(gapOpen))==(scoreMatrix(pos1,pos2) && pos2~=s2 &&pos2~=0) )
      
        [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2,gap,gapOpen);
        if (fin2==true)
            fin=true;
            toAdd=zeros(3,1);
            toAdd(1,1)=seq1(pos1-1);
            toAdd(2,1)='';
            toAdd(3,1)='-';
            alginment = [alginment2,toAdd];
        end
            
           end
        else
    if((scoreMatrix(pos1-1,pos2)+(gapPen*gap(pos1-1,pos2)))==(scoreMatrix(pos1,pos2) && pos2~=s2 &&pos2~=0) )
      
        [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2,gap,gapOpen);
        if (fin2==true)
            fin=true;
            toAdd=zeros(3,1);
            toAdd(1,1)=seq1(pos1-1);
            toAdd(2,1)='';
            toAdd(3,1)='-';
            alginment = [alginment2,toAdd];
        end
    
    end
        end
    catch
        
    end
    
    try
       if  (gap(pos1,pos2-1)==1)
           if((scoreMatrix(pos1,pos2-1)+(gapOpen))==(scoreMatrix(pos1,pos2) &&pos1~=s2 &&pos1~=0) )
          
        [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1,gap,gapOpen);
         if (fin2==true)
            fin=true;
            toAdd=zeros(3,1);
            toAdd(1,1)='-';
            toAdd(2,1)=' ';
            toAdd(3,1)=seq2(pos2-1);
            alginment = [alginment2,toAdd];
         end
      
           end
       else
    if((scoreMatrix(pos1,pos2-1)+(gapPen*gap(pos1,pos2-1)))==(scoreMatrix(pos1,pos2) &&pos1~=s2 &&pos1~=0) )
          
        [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1,gap,gapOpen);
         if (fin2==true)
            fin=true;
            toAdd=zeros(3,1);
            toAdd(1,1)='-';
            toAdd(2,1)=' ';
            toAdd(3,1)=seq2(pos2-1);
            alginment = [alginment2,toAdd];
         end
      
    end
       end
    catch
        
    end

    try
    if((scoreMatrix(pos1-1,pos2-1)+getBlosum62Score(seq1(pos1-1),seq2(pos2-1)))==scoreMatrix(pos1,pos2))
            
        [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2-1,gap,gapOpen);
         
        if(fin2==true)
            fin=true;
            toAdd=zeros(3,1);
            toAdd(1,1)=seq1(pos1-1);
            try
            if (seq1(pos1-1)==seq2(pos2-1))
                 toAdd(2,1)='|';
            else
                toAdd(2,1)=' ';
            end
            catch
                toAdd(2,1)=' ';
            end
           toAdd(3,1)=seq2(pos2-1);
           alginment = [alginment2,toAdd];
        end
        
    end
    catch
         
    end
    
    
   %Edge traceback
   %if on edge need to preform diffent calucation as no gap penalty on some
   %moves
   %Line 67-121
  try
  if(pos1==s1 && (scoreMatrix(pos1,pos2))==(scoreMatrix(pos1,pos2-1)))

      [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1,gap,gapOpen);
      if (fin2==true)
      fin=true;
      toAdd=zeros(3,1);
      toAdd(1,1)='-';
      toAdd(2,1)=' ';
      toAdd(3,1)=seq2(pos2-1);
      alginment = [alginment2,toAdd];
      end
     
  end
  catch
       
  end
  
  try
  if(pos2==s2 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1-1,pos2))
      [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2,gap,gapOpen);
      if (fin2==true)
      fin=true;
      toAdd=zeros(3,1);
      toAdd(1,1)=seq1(pos1-1);
      toAdd(2,1)=' ';
      toAdd(3,1)='-';
      alginment = [alginment2,toAdd];
      end
      
  end
  catch
      
  end
  
  try
  if(pos1==1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1,pos2-1))
  
      [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1,gap,gapOpen);
      if (fin2==true)
      fin=true;
      toAdd=zeros(3,1);
      toAdd(1,1)='-';
      toAdd(2,1)=' ';
      toAdd(3,1)=seq2(pos2-1);
     alginment = [alginment2,toAdd];
      end
      
  end
  catch
  
  end

  try
  if(pos2==1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1-1,pos2))
        
      [alginment2,fin2]=traceBackOpening(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2,gap,gapOpen);
      if (fin2==true)
      fin=true;
      toAdd=zeros(3,1);
      toAdd(1,1)=seq1(pos1-1);
      toAdd(2,1)=' ';
      toAdd(3,1)='-';
      alginment = [alginment2,toAdd];
      end
      
  end
  catch
      
  end
  
  %if at postion 1,1 algorithm end do call back up stack
    if(pos1==1 &&pos2==1)
        alginment=zeros(3,1);
        fin=true
    end
    

    
    output(1)=pos1;
    output(2)=pos2
    alginment=alginment
end

