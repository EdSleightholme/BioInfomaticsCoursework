%TEST 1 Basic Same Sequence based against each other 
disp('TEST 1 Same Sequence against its self')
sequence1='AAAA'
sequence2='AAAA'
[score,algin]=alginSequence(sequence1 ,sequence2);
%Expected results
scoreAns = 16;
disp('Alignment:')
disp(algin)
if(score~= scoreAns)
   disp('FAIL TEST 1') 
   disp('Expected score = 16')

disp('Score recevied = ')
disp(score)
   test1 = false;
else
   disp('PASS TEST 1') 
end

%TEST 2  Different Sequence against each other same length
disp('TEST 2 Different Sequence against each other same length')
sequence1='AAAA'
sequence2='AARA'
[score,algin]=alginSequence(sequence1 ,sequence2);
%Expected results
scoreAns = 11;
disp('Alignment:')
disp(algin)
if(score~= scoreAns)
   disp('FAIL TEST 2') 
   test2 = false;
   
   disp('Expected score = 11')
disp('Score recevied = ')
disp(score)
else
   disp('PASS TEST 2') 
end

%TEST 3  Sub Sequence compare to a Sequence
disp('TEST 3 Sub Sequence compare to a Sequence')
sequence1='AAAA'
sequence2='AAA'
[score,algin]=alginSequence(sequence1 ,sequence2);
%Expected results
scoreAns = 12;
disp('Alignment:')
disp(algin)
if(score~= scoreAns)
   disp('FAIL TEST 3') 
   test2 = false;
   
   disp('Expected score = 12')
   disp('Score recevied = ')
   disp(score)
else
   disp('PASS TEST 3') 
end


%TEST 4  DIffernet squences of different length

%TEST 5  JUNK TEST


