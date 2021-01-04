codeunit 50100 "erp Cust. Cat.Disc Calc. Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', true, true)]
    local procedure RunOnAfterValidateQuantity(var Rec: Record "Sales Line")
    begin
        GetCustomerCategoryDisc(Rec);
    end;

    local procedure GetCustomerCategoryDisc(var SalesLine: Record "Sales Line")
    var
        Customer: Record "Customer";
        Category: Record "erp Category";
    begin
        if Customer.get(Salesline."Sell-to Customer No.") then begin
            customer.calcfields("erp Customer Category Code");
            if Category.get(Customer."erp Customer Category Code") then begin
                if Category.Discount <> 0 then begin
                    if salesline."Allow Line Disc." then
                        Salesline.Validate("Line Discount %", Category.Discount);
                end;
            end;

        end;
    end;
}
