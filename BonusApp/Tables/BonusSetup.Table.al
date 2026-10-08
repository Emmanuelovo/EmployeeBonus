table 50100 "Bonus Setup"
{
    Caption = 'Bonus Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Primary Key';
        }
        field(2; "Bonus Rate"; Decimal)
        {
            Caption = 'Bonus Rate %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;
            DataClassification = ToBeClassified;
        }
        field(3; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(4; "Total Bonus Amount"; Decimal)
        {
            Caption = 'Total Bonus Amount';
            FieldClass = FlowField;
            // We will link this once the table for Bonus Entry is set CalcFormula = sum();
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
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