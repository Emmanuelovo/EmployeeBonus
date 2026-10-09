pageextension 50102 "Employee Card Bonus Ext" extends "Employee Card"
{
    layout
    {
        addlast(General)
        {
            field("Total Bonus YTD"; Rec."Total Bonus YTD")
            {
                ApplicationArea = All;
                ToolTip = 'Total recognition bonus for this Employee from 1st January to today.';
            }
        }
    }
    trigger OnOpenPage()
    begin
        // Note: YTD = start of this year until the end of this year
        Rec.SetRange("Bonus Date Filter", CalcDate('<-CY->', Today()), CalcDate('<CY>', Today()));
    end;
}