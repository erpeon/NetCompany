page 50100 "erp Category List"
{
    PageType = List;
    Caption = 'Category List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "erp Category";

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
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Discount; Discount)
                {
                    ApplicationArea = All;
                }
                field("erp No. of Customers"; "erp No. of Customers")
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