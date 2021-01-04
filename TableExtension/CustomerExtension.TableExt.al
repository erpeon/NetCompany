tableextension 50100 "erp Customer" extends Customer
{
    fields
    {
        field(50100; "erp Customer Category Code"; Code[20])
        {
            Caption = 'Customer Category Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("erp Customer Category"."Category Code" where("Customer No." = field("No.")));
            Editable = false;
        }
    }

    trigger OnBeforeDelete()
    var
        erpCustomerCategory: Record "erp Customer Category";
    begin
        erpCustomerCategory.setrange("Customer No.", "No.");
        erpcustomercategory.deleteall;
    end;
}