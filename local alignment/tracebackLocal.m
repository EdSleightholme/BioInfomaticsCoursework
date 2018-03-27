function  [ alginment,fin ] = tracebackLocal(scoreMatrix,seq1,seq2,gapPen,pos1,pos2)
alginment=zeros(3,1);
    fin=false;
    [s1,s2] = size(scoreMatrix);
    %line 9-61
    %try possbile values
    %if find possbile move run trace back from next postion 
    %on call back up add to alignment
    try    
    if((scoreMatrix(pos1-1,pos2)+gapPen)==(scoreMatrix(pos1,pos2)&&pos2~=s2 &&pos2~=1) )
        [alginment,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2);
        if (fin2==true)
            fin=fin2
            toAdd=zeros(3,1);
            toAdd(1,1)=seq1(pos1-1);
            toAdd(2,1)='';
            toAdd(3,1)='-';
            alginment = [alginment,toAdd];
        end
    end
    catch
        
    end
    
    try
        
    if((scoreMatrix(pos1,pos2-1)+gapPen)==(scoreMatrix(pos1,pos2)&&pos1~=s2 &&pos1~=1) )
            [alginment,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1);
            if (fin2==true)
                fin=fin2
            toAdd=zeros(3,1);
            toAdd(1,1)='-';
            toAdd(2,1)=' ';
            toAdd(3,1)=seq2(pos2-1);
            alginment = [alginment,toAdd];
            end
    end
    catch
        
    end

    try
    if((scoreMatrix(pos1-1,pos2-1)+getBlosum62Score(seq1(pos1-1),seq2(pos2-1)))==scoreMatrix(pos1,pos2))
        [alginment,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2-1);
        if(fin2==true)
            fin=fin2
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
        end
        alginment = [alginment,toAdd];
    end
    catch
         
    end
    
    
   %Edge traceback
   %if on edge need to preform diffent calucation as no gap penalty on some
   %moves
   %Line 67-121
  try
  if(pos1==s1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1,pos2-1))
     
      [alginment,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1);
      if (fin2==true)
          fin=fin2
      toAdd=zeros(3,1);
      toAdd(1,1)='-';
      toAdd(2,1)=' ';
      toAdd(3,1)=seq2(pos2-1);
      alginment = [alginment,toAdd];
      end
  end
  catch
       
  end
  
  try
  if(pos2==s2 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1-1,pos2))
       
      [alginment,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2);
      if (fin2==true)
          fin=fin2
      toAdd=zeros(3,1);
      toAdd(1,1)=seq1(pos1-1);
      toAdd(2,1)=' ';
      toAdd(3,1)='-';
      alginment = [alginment,toAdd];
      end
  end
  catch
      
  end
  
 
  
  %if at postion 1,1 algorithm end do call back up stack
    if(scoreMatrix==0)
        alginment=zeros(3,1);
        fin=true;
    end
end

