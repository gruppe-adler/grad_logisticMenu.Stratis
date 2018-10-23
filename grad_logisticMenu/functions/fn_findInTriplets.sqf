params ["_array","_key"];

private _index = -1;

{
    if (_key in _x) exitWith {
        _index = _forEachIndex;
    };
} forEach _array;

_index
