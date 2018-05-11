In the courseworkFinal folder you will find several matlab files that go sequence alginment

Each alginSequence filecan be run separately

with	alginSequence
	basicalginSequence
	alginSequenceLocal

returns a score for alginment
	a alignment visually
	a matrix showing how scoring went

with	alginSequenceGrowingGapLinear
	alginSequenceGrowingGapOpening

returns a score for alginment
	a alignment visually
	a matrix showing how scoring went
	a matrix showing how scoring went

All methods above take 3 values two sequences and a value for gap penelty

Can run all in method main that takes two sequences and a value for gap penelty and prints return values to console

The function readGenBankSequences can take the filepath to a genbank file and return the sequence contained with in

Also in file are some demo values of running in the main method 