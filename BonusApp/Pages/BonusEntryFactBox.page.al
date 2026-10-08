page 50102 "Bonus Entry FactBox"
{
    PageType = CardPart;
    caption = 'Bonus Summary';
    SourceTable = "Bonus Entry";

    layout
    {
        area(Content)
        {
            field("Employee Total Bonus"; Rec."Employee Total Bonus")
            {
                ApplicationArea = All;
                ToolTip = 'Total Bonus for the employee thus far, selected from the ilne';
            }
            field("All Employees Total Bonus"; Rec."All Employees Total Bonus")
            {
                ApplicationArea = All;
                ToolTip = 'Running Total for all bonus entries';
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