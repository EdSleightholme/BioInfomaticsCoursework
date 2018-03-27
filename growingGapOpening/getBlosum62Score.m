function [ output ] = getBlosum62Score( char1,char2 )
 
    scoringMatrix = blosum(62);
    
    switch char1
        case 'A' 
            temp1=1;
        case 'R' 
            temp1=2;
        case 'N' 
            temp1=3;
        case 'D' 
            temp1=4;
        case 'C' 
            temp1=5;
        case 'Q' 
            temp1=6;
        case 'E' 
            temp1=7;
        case 'G' 
            temp1=8;
        case 'H' 
            temp1=9;
        case 'I' 
            temp1=10;
        case 'L' 
            temp1=11;
        case 'K' 
            temp1=12;
        case 'M' 
            temp1=13;
        case 'F' 
            temp1=14;
        case 'P' 
            temp1=15;
        case 'S' 
            temp1=16;
        case 'T' 
            temp1=17;
        case 'W' 
            temp1=18;
        case 'Y' 
            temp1=19;
        case 'V' 
            temp1=20;
        case 'B' 
            temp1=21;
        case 'Z' 
            temp1=22;
        case 'X' 
            temp1=23;
        otherwise
            temp1=24;
    end
    temp2=temp1;
    switch char2
        case 'A' 
            temp1=1;
        case 'R' 
            temp1=2;
        case 'N' 
            temp1=3;
        case 'D' 
            temp1=4;
        case 'C' 
            temp1=5;
        case 'Q' 
            temp1=6;
        case 'E' 
            temp1=7;
        case 'G' 
            temp1=8;
        case 'H' 
            temp1=9;
        case 'I' 
            temp1=10;
        case 'L' 
            temp1=11;
        case 'K' 
            temp1=12;
        case 'M' 
            temp1=13;
        case 'F' 
            temp1=14;
        case 'P' 
            temp1=15;
        case 'S' 
            temp1=16;
        case 'T' 
            temp1=17;
        case 'W' 
            temp1=18;
        case 'Y' 
            temp1=19;
        case 'V' 
            temp1=20;
        case 'B' 
            temp1=21;
        case 'Z' 
            temp1=22;
        case 'X' 
            temp1=23;
        otherwise
            temp1=24;
    end
    output=scoringMatrix(temp2,temp1);
end

