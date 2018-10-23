#include "..\idcmacros.hpp"

params ["_dialog"];

{
    (_dialog displayCtrl IDC_AMOUNT) lbAdd _x;
} forEach ["1","2","5","10","15","20"];

(_dialog displayCtrl IDC_AMOUNT) lbSetCurSel 0;

uiNamespace setVariable ["grad_logisticMenu_main", _dialog];
