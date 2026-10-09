codeunit 50100 "Bonus Calculator"
{
    procedure calculateBonus(var BonusEntry: Record "Bonus Entry")
    var
        BonusSetup: Record "Bonus Setup";
    begin
        if not BonusSetup.Get('DEFAULT') then Error(SetupMissingErr);

        if not BonusSetup.Enabled then Error(DisabledErr);

        // I fetch the rate from ONLY Setup. Zero Hardcoding.

        BonusEntry."Bonus Rate %" := BonusSetup."Bonus Rate";

        BonusEntry."Bonus Amount" := Round(BonusEntry."Base Amount" * BonusSetup."Bonus Rate" / 100, 0.01)
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bonus Entry", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertBonusEntry(var Rec: Record "Bonus Entry"; RunTrigger: Boolean)

    begin
        if Rec.IsTemporary() then exit;
        calculateBonus(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bonus Entry", 'OnBeforeModifyEvent', '', false, false)]
    local procedure OnBeforeModifyBonusEntry(var Rec: Record "Bonus Entry"; var xRec: Record "Bonus Entry"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary() then exit;

        if Rec."Base Amount" <> xRec."Base Amount" then calculateBonus(Rec);
    end;

    // 
    var
        SetupMissingErr: Label 'Bonus Setup has not been configured. Open Bonus Setup first, and configure it.';
        DisabledErr: Label 'Employee Recognition Bonus is disabled in Bonus Setup.';

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}