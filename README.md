# Employee Recognition Bonus (Business Central extension)

A Business Central AL extension that rewards employees with a bonus calculated from a rate stored in setup.
The rate is never hardcoded: an event subscriber calls a codeunit that reads it from the setup table.

## What it does
- **Bonus Setup**: (singleton) bonus rate (%) and an Enabled switch.
- **Bonus Entry**: one record per recognition (employee, date, base amount, reason). Rate and bonus amount are calculated automatically on insert.
- **Bonus Entries list** with a FactBox showing the employee total and the running total of all bonuses.
- **Employee Card** shows **Total Bonus YTD** (added through a table extension and a page extension).
- **Bonus Overview** report with date and employee filters.
- **Tests**: 10% x 500,000 = 50,000

## Objects
| Type | ID | Name |
|---|---|---|
| Table | 50100 | Bonus Setup |
| Table | 50101 | Bonus Entry |
| Page | 50100 | Bonus Setup |
| Page | 50101 | Bonus Entry List |
| Page | 50102 | Bonus Entry FactBox |
| Codeunit | 50100 | Bonus Calculation |
| Codeunit | 50101 | Bonus Calculation Tests |
| Table Extension | 50100 | Employee Bonus Ext |
| Page Extension | 50100 | Employee Card Bonus Ext |
| Report | 50100 | Bonus Overview |

## Project structure
```
BonusApp/
  Tables/       BonusSetup.Table.al, BonusEntry.Table.al
  Pages/        BonusSetup.Page.al, BonusEntryList.Page.al, BonusEntryFactBox.Page.al
  Codeunits/    BonusCalculation.Codeunit.al
  Extensions/   Employee.TableExt.al, EmployeeCard.PageExt.al
  Reports/      BonusOverview.Report.al
  Tests/        BonusCalculationTest.Codeunit.al
```

## Setup
1. Install VS Code and the **AL Language** extension.
2. Create the project with **AL: Go!** (Microsoft cloud sandbox).
3. In `app.json` set `idRanges` to `50100` - `50149`.
4. Copy the `BonusApp` folder into the project, next to `app.json`.
5. Run **AL: Download Symbols**, then press **F5** to publish to your sandbox.

## You can test using these instructions
1. Search **Bonus Setup**. Rate = 10, Enabled = on.
2. Search **Bonus Entries**. Add: employee, date, base amount 500,000. Bonus amount shows 50,000.
3. Add a second entry of 300,000. The FactBox total shows 80,000 for that employee.
4. Open the **Employee Card**. Total Bonus YTD shows 80,000.

## Git
```
git init
git branch -M main
git remote add origin <your repository URL>
git add .
git commit -m "Initialize Bonus Extension Project"
git push -u origin main
```

## These are the Build phases
1. Foundation: project, tables, relations, FlowFields
2. UI: setup card, entry list, FactBox
3. Logic: codeunit and event subscribers
4. Extensions: Employee table and page extensions
5. Reporting: Bonus Overview layout
6. Quality: tests, Git history, .app package, demo