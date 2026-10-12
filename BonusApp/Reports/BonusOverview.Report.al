report 50100 "Bonus Overview"
{
    Caption = 'Bonus Overview';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = BonusOverviewRdlc;

    dataset
    {
        dataitem(BonusEntry; "Bonus Entry")
        {
            DataItemTableView = sorting("Employee No.", "Bonus Date");
            RequestFilterFields = "Employee No.";

            column(CompanyName; CompanyProperty.DisplayName()) { }
            column(AppliedFilters; AppliedFilters) { }
            column(EmployeeNo; "Employee No.") { }
            column(EmployeeName; "Employee Name") { }
            column(BonusDate; "Bonus Date") { }
            column(BaseAmount; "Base Amount") { }
            column(BonusRate; "Bonus Rate %") { }
            column(BonusAmount; "Bonus Amount") { }
            column(Reason; Reason) { }

            trigger OnPreDataItem()
            begin
                if (DateFrom <> 0D) and (DateTo <> 0D) then
                    BonusEntry.SetRange("Bonus Date", DateFrom, DateTo)
                else
                    if DateFrom <> 0D then
                        BonusEntry.SetFilter("Bonus Date", '>=%1', DateFrom)
                    else
                        if DateTo <> 0D then
                            BonusEntry.SetFilter("Bonus Date", '<=%1', DateTo);

                AppliedFilters := BonusEntry.GetFilters();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(DateFromField; DateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'Date From';
                        ToolTip = 'Only bonuses on or after this date are included. Leave blank for no start limit.';
                    }
                    field(DateToField; DateTo)
                    {
                        ApplicationArea = All;
                        Caption = 'Date To';
                        ToolTip = 'Only bonuses on or before this date are included. Leave blank for no end limit.';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(BonusOverviewRdlc)
        {
            Type = RDLC;
            LayoutFile = 'BonusApp/Reports/BonusOverview.rdlc';
            Caption = 'Bonus Overview (grouped by employee)';
        }
    }

    var
        DateFrom: Date;
        DateTo: Date;
        AppliedFilters: Text;
}
