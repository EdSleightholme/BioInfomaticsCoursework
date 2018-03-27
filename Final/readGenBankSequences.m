function [ output ] = readGenBankSequences(name)
    genBankStuct=genbankread(name);
    output=genBankStuct.Sequence;
end

