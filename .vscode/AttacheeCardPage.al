page 50103 "Attache Page"
{
    PageType = List;
    SourceTable = Employe;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Attachee Page';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee ID"; Rec."EmployeeID")
                {
                    ApplicationArea = All;
                    Caption = 'Employee ID';
                }

                field("First Name"; Rec."FirstName")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }

                field("Last Name"; Rec."LastName")
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ShowStipend)
            {
                Caption = 'Show Stipend';
                Image = View;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EmployeeStipend: Codeunit "Employee Stipend";
                    StipendAmount: Decimal;
                begin
                    StipendAmount := EmployeeStipend.GetStipendByEmployeeID(Rec."EmployeeID");
                    Message('The stipend for Employee ID %1 is %2', Rec."EmployeeID", StipendAmount);
                end;
            }
        }
    }
}
