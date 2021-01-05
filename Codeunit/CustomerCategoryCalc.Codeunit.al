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
        CustomerCategory: Record "erp Customer Category";
    begin
        if Customer.get(Salesline."Sell-to Customer No.") then begin
            customer.calcfields("erp Customer Category Code");
            if (Category.get(Customer."erp Customer Category Code")) and
               (CustomerCategory.get(salesline."Sell-to Customer No.")) then begin
                if (Category.Discount <> 0) and (CustomerCategory."Active Status" <> CustomerCategory."Active Status"::"On Hold") then begin
                    if salesline."Allow Line Disc." then
                        Salesline.Validate("Line Discount %", Category.Discount);
                end;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInsertEvent', '', true, true)]
    local procedure DoSomethingOnAfterInsert(var Rec: Record "Sales Line")
    begin
        SetDescriptionOnLine(Rec);
    end;

    local procedure SetDescriptionOnLine(var SalesLine: Record "Sales Line")
    begin
        SalesLine.Description := 'From AL';
        salesline.modify;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterModifyEvent', '', true, true)]
    local procedure DoSomethingOnAfterModify(var Rec: Record "Sales Line")
    begin
        ModifyDescriptionOnLine(Rec);
    end;

    local procedure ModifyDescriptionOnLine(var SalesLine: Record "Sales Line")
    begin
        if copystr(salesline.Description, 1, 1) <> '¤' then begin
            SalesLine.Description := '¤' + SalesLine.Description;
            salesline.modify;
        end;
    end;
}
