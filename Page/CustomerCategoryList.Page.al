page 50101 "erp Customer Category List"
{
    PageType = List;
    Caption = 'Customer Category list';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "erp Customer Category";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Category Code"; "Category Code")
                {
                    ApplicationArea = All;

                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Active Status"; "Active Status")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}