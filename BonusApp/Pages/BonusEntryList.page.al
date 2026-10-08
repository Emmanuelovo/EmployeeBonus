page 50101 "Bonus Entry List"
{
    Caption = 'Bonus Entry List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Entry";

    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
                field("Entry No."; Rec."Entry No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Bonus Date"; Rec."Bonus Date")
                {
                    ApplicationArea = All;
                }
                field("Base Amount"; Rec."Base Amount")
                {
                    ApplicationArea = All;
                }
                field("Bonus Rate %"; Rec."Bonus Rate %")
                {
                    ApplicationArea = All;
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(BonusSummary; "Bonus Entry FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Entry No" = field("Entry No");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}