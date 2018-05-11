function [ alginment,fin ] = traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2)
    alginment=zeros(3,1);
    fin=false;%To see if at end of alignment
    [s1,s2] = size(scoreMatrix);

    %see if possible to go one cell left from current cell
    try
    if((scoreMatrix(pos1-1,pos2)+gapPen)==(scoreMatrix(pos1,pos2) && pos2~=s2 && pos2~=0) )
        %move next location
        [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2);
        %if good path append to final alginment
            if (fin2==true)
                fin =true;
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
    %see if possible to go one cell up from current cell
    if((scoreMatrix(pos1,pos2-1)+gapPen)==(scoreMatrix(pos1,pos2)) && pos1~=s2 && pos1~=0 )
            %move next location
            [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1);
             %if good path append to final alginment
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
    
    %see if possible to go diagonal from current cell
    try
    if((scoreMatrix(pos1-1,pos2-1)+getBlosum62Score(seq1(pos1-1),seq2(pos2-1)))==scoreMatrix(pos1,pos2))
        %move next location
        [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2-1);
        %if good path append to final alginment
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
    
    
   %see at bottom row of scoring table
  try
  if(pos1==s1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1,pos2-1))
      %move next location
      [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1);
      %if good path append to final alginment
      if(fin2==true)
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
   %see if on edge is posssible to move up
  try
  if(pos2==s2 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1-1,pos2))
       %move next location
      [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2);
       %if good path append to final alginment
      if(fin2==true)   
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
  %see if on edge is possible to move left
  try
  if(pos1==1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1,pos2-1))
       %move next location
      [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1,pos2-1);
      %if good path append to final alginment
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
  %see if on edge is possible to move up
  try
  if(pos2==1 && scoreMatrix(pos1,pos2)==scoreMatrix(pos1-1,pos2))
    %move next location
      [alginment2,fin2]=traceBack(scoreMatrix,seq1,seq2,gapPen,pos1-1,pos2);
      %if good path append to final alginment
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
        fin=true;
    end

   
end

