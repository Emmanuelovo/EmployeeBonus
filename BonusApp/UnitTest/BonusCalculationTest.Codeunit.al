codeunit 50101 "Bonus Calculation Tester"
{
    Subtype = Test;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure BonusIsTenPercentOfBaseAmount()
    var
        BonusEntry: Record "Bonus Entry";
    begin
        // If am using 10% basis here
        setRate(10);

        // when I insert say 600,000
        InsertEntry(BonusEntry, 600000);

        // then Bonus is expected to be 60,000
        VerifyAmount(600000, BonusEntry."Bonus Amount");
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure RateIsReadFromSetupNotHardcoded()
    var
        BonusEntry: Record "Bonus Entry";
    begin
        // If I use a rate of 15%
        setRate(15);

        // when the base amount is 200000
        InsertEntry(BonusEntry, 200000);

        // Then bonus should be = 30,000
        verifyAmount(30000, BonusEntry."Bonus Amount")
    end;

    local procedure SetRate(Rate: Decimal)
    var
        BonusSetup: Record "Bonus Setup";
    begin
        if not BonusSetup.Get('DEFAULT') then begin
            BonusSetup.Init();
            BonusSetup."Primary Key" := 'DEFAULT';
            BonusSetup.Insert();
        end;
        BonusSetup."Bonus Rate" := Rate;
        BonusSetup.Enabled := true;
        BonusSetup.Modify();
    end;

    local procedure InsertEntry(var BonusEntry: Record "Bonus Entry"; BaseAmount: Decimal)
    begin
        BonusEntry.Init();
        BonusEntry."Employee No." := 'TESTEMP';
        BonusEntry."Bonus Date" := Today();
        BonusEntry."Bonus Amount" := BaseAmount;
        BonusEntry.Insert(true);
    end;

    local procedure VerifyAMount(Expected: Decimal; Actual: Decimal)
    begin
        if Expected <> Actual then Error('Expected bonus %1 but you entered %2.', Expected, Actual);
    end;
}