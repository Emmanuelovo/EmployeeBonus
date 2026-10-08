table 50101 "Bonus Entry"
{
    Caption = 'Bonus Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then "Employee Name" := CopyStr(Employee.FullName(), 1, MaxStrLen("Employee Name"))
            end;
        }
        field(3; "Bonus Date"; Date)
        {
            Caption = 'Bonus Date';
        }
        field(4; "Base Amount"; Decimal)
        {
            Caption = 'Base Amount';
        }
        field(5; "Bonus Rate %"; Decimal)
        {
            Caption = 'Bonus Rate %';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(6; "Bonus Amount"; Decimal)
        {
            Caption = 'Bonus Amount';
            Editable = false;
        }
        field(7; Reason; Text[250])
        {
            Caption = 'Reason';
        }
        field(8; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(9; "Employee Total Bonus"; Decimal)
        {
            Caption = 'Employee Total Bonus';
            FieldClass = FlowField;
            CalcFormula = sum("Bonus Entry"."Bonus Amount" where("Employee No." = field("Employee No.")));
            Editable = false;
        }
        field(10; "All Employees Total Bonus"; Decimal)
        {
            Caption = 'All Employees Total Bonus';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Bonus Entry"."Bonus Amount");
        }
    }

    keys
    {
        key(pk; "Entry No")
        {
            Clustered = true;
        }
        key(EmployeeDate; "Employee No.", "Bonus Date")
        {
            SumIndexFields = "Bonus Amount";
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}