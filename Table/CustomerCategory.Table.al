table 50101 "erp Customer Category"
{
    Caption = 'Customer Category';
    DataClassification = CustomerContent;
    DrillDownPageId = "erp Customer Category List";
    LookupPageId = "erp Customer Category List";

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(2; "Category Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Category Code';
            TableRelation = "erp Category";
        }

    }
    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
}