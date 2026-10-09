tableextension 50100 "Employee Bonus Ext" extends Employee
{
    fields
    {
        field(50100; "Bonus Date Filter"; Date)
        {
            Caption = 'Bonus Date filter';
            FieldClass = FlowFilter;
        }
        field(50101; "Total Bonus YTD"; Decimal)
        {
            Caption = 'Total Bonus YTD';
            FieldClass = FlowField;
            CalcFormula = sum("Bonus Entry"."Bonus Amount" where("Employee No." = field("No."), "Bonus Date" = field("Bonus Date Filter")));
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}