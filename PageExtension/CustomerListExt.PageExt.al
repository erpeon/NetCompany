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
                        salesline.setrange("sell-to customer no.");
                        salesline.setrange("Document No.", salesline."Document No.");
                        salesline.findlast;
                        SalesLine2 := SalesLine;
                        LineNo := SalesLine."Line No.";
                        salesline2.init;
                        salesline2."Line No." := LineNo + 10000;
                        salesline2.description := 'New Line';
                        if not salesline2.insert then
                            error('Jeg kan ikke finde næste linje %1 %2 %3', salesline.getfilters, salesline."Line No.", salesline2."Line No.")
                    end;
                end;
            }
        }
    }
}