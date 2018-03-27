function [ output ] = main(sequence1 ,sequence2 )

    [scoreNormal,alignmentNormal] = alginSequence( sequence1 ,sequence2 );
    scoreNormal=scoreNormal
    alignmentNormal=alignmentNormal
    
    [ scoreLocal,alignmentLocal] = alginSequenceLocal( sequence1 ,sequence2 );
    scoreLocal=scoreLocal
    alignmentLocal=alignmentLocal
    
    [ scoreLinearGrowingGapPenelty,alignmentLinearGrowingGapPenelty]=alginSequenceGrowingGapLinear(sequence1,sequence2);
    scoreLinearGrowingGapPenelty=scoreLinearGrowingGapPenelty
    alignmentLinearGrowingGapPenelty=alignmentLinearGrowingGapPenelty
    
    [ scoreOpeningGapPenelty,alignmentOpeningGapPenelty]=alginSequenceGrowingGapLinear(sequence1,sequence2);
    scoreOpeningGapPenelty=scoreOpeningGapPenelty
    alignmentOpeningGapPenelty=alignmentOpeningGapPenelty
    
    %IF HAVE TIME DO FASTA ALGORITHM
    %PLOT TRACEBACK
    %DECIDE WHICH ALIGNMENT IS BEST
    output=12;
end

