report 50100 "Bonus Overview"
{
    Caption = 'Bonus Overview';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Bonus Entry"; "Bonus Entry")
        {
            DataItemTableView = sorting("Employee No.", "Bonus Date");
            RequestFilterFields = "Bonus Date", "Employee No.";

            column(Employee_No_; "Employee No.")
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Bonus_Date; "Bonus Date")
            {

            }
            column(Bonus_Amount; "Bonus Amount")
            {

            }
            column(Bonus_Rate__; "Bonus Rate %")
            {

            }
            column(Base_Amount; "Base Amount")
            {

            }
            column(Reason; Reason)
            {

            }
        }
    }
}