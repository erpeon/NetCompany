pageextension 50102 "erp Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("erp Customer Category Code"; "erp Customer Category Code")
            {
                ApplicationArea = All;
                ToolTip = 'Shows current Customer Category Code.';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(Category)
            {
                Caption = 'Category';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "erp Customer Category List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}