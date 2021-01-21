pageextension 50104 "SCL MyExtension" extends "VAT Statement Preview"
{
    layout
    {
        addlast(Content)
        {

        }
    }

    actions
    {
        addlast(Processing)
        {
            action("SCL ValidateVATSetup")
            {
                Caption = 'Validate VAT Entries';
                ApplicationArea = All;
                Image = Discount;

                trigger OnAction()
                var
                    FindVAT: Codeunit "VATBalancingGLtoStatement";

                begin
                    FindVAT.TestVATStatementEntries(Rec, rec.getfilter("Date Filter"));
                end;
            }


        }
    }
}