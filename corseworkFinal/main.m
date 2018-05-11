function [ output ] = main(sequence1 ,sequence2,gapPenelty )
    %basic gobal alginment
    [scoreNormalBasic,alignmentLocalBasic,scoreTableBasic] = basicalginSequence( sequence1 ,sequence2,gapPenelty );
    scoreNormalBasic=scoreNormalBasic
    alignmentLocalBasic=alignmentLocalBasic
    scoreTableBasic=scoreTableBasic
    %basic gobal alginment where not beign in the middle of sequence means no gap penelty 
    [scoreNormal,alignmentNormal,scoreTable] = alginSequence( sequence1 ,sequence2,gapPenelty );
    scoreNormal=scoreNormal
    alignmentNormal=alignmentNormal
    scoreTable=scoreTable
    %basic local alginment
    [ scoreLocal,alignmentLocal,scoreTableLocal] = alginSequenceLocal( sequence1 ,sequence2,gapPenelty );
    scoreLocal=scoreLocal
    alignmentLocal=alignmentLocal
    scoreTableLocal=scoreTableLocal
    %gobal alginment where the gap grows if gaps chain
    [ scoreLinearGrowingGapPenelty,alignmentLinearGrowingGapPenelty,scoreTableGrowing,gapTableGrowing]=alginSequenceGrowingGapLinear(sequence1,sequence2,gapPenelty);
    scoreLinearGrowingGapPenelty=scoreLinearGrowingGapPenelty
    alignmentLinearGrowingGapPenelty=alignmentLinearGrowingGapPenelty
    scoreTableGrowing=scoreTableGrowing
    gapTableGrowing=gapTableGrowing
    
    
    %gobal alginment where a gap has a opening gap penelty 
    gapOpening=-20
    [ scoreOpeningGapPenelty,alignmentOpeningGapPenelty,scoreTableOpening,gapTableOpening]=alginSequenceGrowingGapOpening(sequence1,sequence2,gapPenelty,gapOpening);
    scoreOpeningGapPenelty=scoreOpeningGapPenelty
    alignmentOpeningGapPenelty=alignmentOpeningGapPenelty
    scoreTableOpening=scoreTableOpening
    gapTableOpening=gapTableOpening

    
    output=12;
end

