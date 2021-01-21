codeunit 50101 VATBalancingGLtoStatement
{
    trigger OnRun()
    begin

    end;

    Procedure TestVATPostingSetup(GLAccountNo: Text)
    var
        VATPostSetup: Record "VAT Posting Setup";
        VATStatementLine: Record "VAT Statement Line";
        IsFound: Boolean;
    begin
        VATPostSetup.setrange("Sales VAT Account", GLAccountNo);
        if vatpostsetup.findset then
            repeat
                VATStatementLine.setrange("VAT Bus. Posting Group", vatpostsetup."VAT Bus. Posting Group");
                vatstatementline.setfilter("Row No.", '<>%1', '');
                if vatstatementline.findset then
                    repeat
                        IsFound := true;
                        message('%1 via %2 is found in %3 Row No. %4.', GLAccountNo,
                                                                        Vatstatementline."VAT Bus. Posting Group",
                                                                        vatstatementline."Statement Name",
                                                                        VATStatementLine."Row No.");
                        VATStatementLine.setrange("Statement Name", VATStatementLine."Statement Name");
                        vatstatementline.findlast;
                        vatstatementline.setrange("statement name");
                    until VATStatementLine.next = 0;
            until vatpostsetup.next = 0;
        if not IsFound then
            message('%1 is not represented in any VAT Statement', GLAccountNo);
    end;

    procedure TestVATStatementEntries(StatementName: Record "VAT Statement Name"; PeriodFilter: Text)
    var
        VATEntry: Record "VAT Entry";
        VATStatementLine: Record "VAT Statement Line";
        VATPostSetupTemp: Record "VAT Posting Setup" temporary;
    begin
        VATStatementLine.setrange("Statement Template Name", statementname."Statement Template Name");
        VATstatementline.setrange("Statement Name", statementname."Name");
        VATEntry.setfilter("Posting Date", PeriodFilter);
        if VATEntry.FINDSET THEN
            repeat
                vatstatementline.setrange("VAT Bus. Posting Group", vatentry."VAT Bus. Posting Group");
                vatstatementline.setrange("VAT Prod. Posting Group", VATentry."VAT Prod. Posting Group");
                if VATStatementLine.IsEmpty then begin
                    if not vatpostsetupTemp.get(vatentry."VAT Bus. Posting Group", vatentry."VAT Prod. Posting Group") then begin
                        vatpostsetuptemp."VAT Bus. Posting Group" := vatentry."VAT Bus. Posting Group";
                        vatpostsetuptemp."VAT Prod. Posting Group" := vatentry."VAT Prod. Posting Group";
                        if vatpostsetuptemp.Insert() then;
                        // message('VAT Bus. Grp. %1 VAT Prod. Grp. %2 combination is used but not found (%3).', vatentry."VAT Bus. Posting Group",
                        //                                                                                      vatentry."VAT Prod. Posting Group",
                        //                                                                                      vatentry."Entry No.");
                    end;
                    if not vatpostsetuptemp.IsEmpty then
                        page.run(Page::"VAT Posting Setup", VATPostSetupTemp);

                end;

            until VATEntry.NEXT = 0;

    end;


}
