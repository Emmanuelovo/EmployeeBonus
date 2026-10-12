page 50100 "Bonus Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Bonus Rate"; Rec."Bonus Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus percentage applied to the base amount.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether bonus calculation is switched on.';
                }
                field("Total Bonus Amount"; Rec."Total Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the total of all bonus entries.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        // Setting the Singleton, to always fetch one record with the DEFAULT key
        Rec.Reset();
        if not Rec.Get('DEFAULT') then begin
            Rec.Init();
            Rec."Primary Key" := 'DEFAULT';
            Rec."Bonus Rate" := 10;
            Rec.Enabled := true;
            Rec.Insert();
        end;
    end;
}