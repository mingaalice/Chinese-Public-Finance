function data = import_data(filename)
% IMPORT_DATA Import annual fiscal and public debt data from Excel.
%
% Input:
%   filename - Name or path of the Excel file.
%
% Output:
%   data - Structure containing all variables and year information.

    T = readtable(filename);
    T = sortrows(T, 'year'); % ascending order

    % year
    data.year = T.year;

    % Public debt issuance
    data.ann_pb_issu = T.ann_pb_issu;

    data.ann_treasury_issu = T.ann_treasury_issu;
    data.ann_treasury_issu_d = T.ann_treasury_issu_d;
    data.ann_treasury_issu_e = T.ann_treasury_issu_e;

    data.ann_lgen_issu = T.ann_lgen_issu;
    data.ann_lspe_issu = T.ann_lspe_issu;

    % Outstanding public debt
    data.ost_pb = T.ost_pb;

    data.ost_treasury = T.ost_treasury;
    data.ost_lgen = T.ost_lgen;
    data.ost_lspe = T.ost_lspe;

    % Principal repayment
    data.ann_pb_principal_repay = T.ann_pb_principal_repay;

    data.ann_treasury_principal_repay = T.ann_treasury_principal_repay;
    data.ann_lgen_principal_repay = T.ann_lgen_principal_repay;
    data.ann_lspe_principal_repay = T.ann_lspe_principal_repay;

    % Tax revenue
    data.sum_tax = T.sum_tax;

    data.d_vat = T.d_vat;
    data.d_ct = T.d_ct;
    data.vatct_import = T.vatct_import;
    data.rbt_export = T.rbt_export;
    data.cit = T.cit;
    data.iit = T.iit;

    data.rt = T.rt;
    data.umct = T.umct;
    data.stampt = T.stampt;
    data.tt = T.tt;
    data.vpt = T.vpt;
    data.tariff = T.tariff;
    data.other = T.other;

end