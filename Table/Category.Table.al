table 50100 "erp Category"
{
    Caption = 'Category';
    DataClassification = CustomerContent;
    DrillDownPageId = "erp Category List";
    LookupPageId = "erp Category List";

    fields
    {
        field(1; "Category Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Category Code';
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Discount"; Decimal)
        {
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(4; "erp No. of Customers"; Integer)
        {
            Caption = 'Antal kunder';
            FieldClass = FlowField;
            CalcFormula = count("erp Customer Category" where("Category Code" = field("Category Code")));
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Category Code")
        {
            Clustered = true;
        }
    }
}