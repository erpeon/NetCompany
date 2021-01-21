pageextension 50103 "GLEntryListExt.PageExt.al" extends "General Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("VAT Bus. Post. Group"; "VAT Bus. Posting Group")
            {
                ApplicationArea = All;
            }

            field("VAT Prod. Post. Group"; "VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        addlast(navigation)
        {
            action(ShowVATSetup)
            {
                trigger OnAction()
                var
                    ShowSetup: Codeunit "VATBalancingGLtoStatement";

                begin
                    ShowSetup.TestVATPostingSetup("G/L Account No.");
                end;
            }
            action(ShowInExcel)
            {
                trigger OnAction()
                var
                    ExcelBufTemp: Record "Excel Buffer" temporary;
                begin
                    ExcelBufTemp.Reset();
                    ExcelBufTemp.DeleteAll();
                    if Rec.findset then
                        repeat


                        until Rec.Next = 0;
                end;
            }
        }
    }
}
