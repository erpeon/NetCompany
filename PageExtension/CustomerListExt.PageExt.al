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

            action(CreateSalesLine)
            {
                Caption = 'CreateSalesLine';
                ApplicationArea = All;
                Image = AddAction;
                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    SalesLine2: Record "Sales line";
                    LineNo: Integer;
                begin
                    SalesLine.setrange("Document Type", salesline."Document Type"::Order);
                    salesline.setrange("Sell-to Customer No.", "No.");
                    if salesline.findlast then begin
                        SalesLine2 := SalesLine;
                        salesline2."Line No." += 10000;
                        salesline2.init;
                        salesline2.description := 'New Line';
                        salesline2.insert;

                    end;
                end;
            }
        }
    }
}