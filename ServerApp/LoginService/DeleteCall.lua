
_G.CDeleteCall = {}
CDeleteCall.tCall = {};

function CDeleteCall:AddCall(func)
    table.insert(self.tCall, func);
end;

function CDeleteCall:DoDelete(dwRoleID)
    for _, v in ipairs(self.tCall) do
        v(dwRoleID);
    end;
end;



