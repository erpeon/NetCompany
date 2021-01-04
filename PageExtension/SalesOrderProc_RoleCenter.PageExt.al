pageextension 50101 "erp SO Proc. RoleC" extends "Order Processor Role Center"
{
    layout
    {
    }

    actions
    {
        addlast(Embedding)
        {
            action("Customer Category")
            {
                Caption = 'Kategori';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "erp Category List";
            }
        }
    }
}
