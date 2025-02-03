--[[
2d向量
--]]
_G.Vector2 = {}
function Vector2.new(x,y)
	local obj = {};
	obj.x = x or 0;
	obj.y = y or 0;
	for i,v in pairs(Vector2) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function Vector2:absolute()
	local resVec = Vector2.new(math.abs(self.x),math.abs(self.y));
	return resVec;
end;

function Vector2:normalize()
	local modValue = self:magnitude();
	self.x = self.x/modValue;
	self.y = self.y/modValue;
	if string.find(tostring(self.x),"nan") then
		self.x = 0;
	end;
	if string.find(tostring(self.y),"nan") then
		self.y = 0;
	end;
	return self;
end;

function Vector2:magnitude()
	return math.sqrt(self.x * self.x + self.y* self.y);
end;


--静态方法
function Vector2.add(vec1,vec2)
	local resVec = Vector2.new();
	resVec.x = vec1.x + vec2.x;
	resVec.y = vec1.y + vec2.y;
	return resVec;
end;

function Vector2.sub(vec1,vec2)
	local resVec = Vector2.new();
	resVec.x = vec1.x - vec2.x;
	resVec.y = vec1.y - vec2.y;
	return resVec;
end;
function Vector2.mul(vec1,fValue)
	local resVec = Vector2.new();
	resVec.x = vec1.x * fValue;
	resVec.y = vec1.y * fValue;
	return resVec;
end;
function Vector2.dot(vec1,vec2)
	local fValue = vec1.x * vec2.x + vec1.y *vec2.y;
	if string.find(tostring(fValue),"nan") then
		return 0;
	end;
	return fValue;
end;

function Vector2.cross(vec1,vec2)
	local fValue = vec.x * vec2.y - vec1.y *vec2.x;
	if string.find(tostring(fValue),"nan") then
		return 0;
	end;
	return fValue;
end;

function Vector2.equal(vec1,vec2)
	if math.abs(vec1.x - vec2.x) > 0.00001 then
		return false;
	elseif math.abs(vec1.y - vec2.y) > 0.00001 then
		return false;
	end;
	return true;
end;



--[[
3d向量
--]]
_G.Vector3 = {}
function Vector3.new(x,y,z)
	local obj = {};
	obj.x = x or 0;
	obj.y = y or 0;
	obj.z = z or 0;
	for i,v in pairs(Vector2) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function Vector3:absolute()
	local resVec = Vector3.new(math.abs(self.x),math.abs(self.y),math.abs(self.z));
	return resVec;
end;

function Vector3:normalize()
	local modValue = self:magnitude();
	self.x = self.x/modValue;
	self.y = self.y/modValue;
	self.z = self.z/modValue;
	if string.find(tostring(self.x),"nan") then
		self.x = 0;
	end;
	if string.find(tostring(self.y),"nan") then
		self.y = 0;
	end;
	if string.find(tostring(self.z),"nan") then
		self.z = 0;
	end;
	
	return self;
end;

function Vector3:magnitude()
	return math.sqrt(self.x * self.x + self.y* self.y+ self.z* self.z);
end;


--静态方法
function Vector3.add(vec1,vec2)
	local resVec = Vector3.new();
	resVec.x = vec1.x + vec2.x;
	resVec.y = vec1.y + vec2.y;
	resVec.z = vec1.z + vec2.z;
	return resVec;
end;

function Vector3.sub(vec1,vec2)
	local resVec = Vector3.new();
	resVec.x = vec1.x - vec2.x;
	resVec.y = vec1.y - vec2.y;
	resVec.z = vec1.z - vec2.z;
	return resVec;
end;
function Vector3.mul(vec1,fValue)
	local resVec = Vector3.new();
	resVec.x = vec1.x * fValue;
	resVec.y = vec1.y * fValue;
	resVec.z = vec1.z * fValue;
	return resVec;
end;
function Vector3.dot(vec1,vec2)
	local fValue = vec1.x * vec2.x + vec1.y *vec2.y + vec1.z* vec2.z;
	if string.find(tostring(fValue),"nan") then
		return 0;
	end;
	return fValue;
end;

function Vector3.cross(vec1,vec2)
	local resVec = Vector3.new();
	resVec.x = vec1.y * vec2.z - vec1.z * vec2.y;
	resVec.y = vec1.z * vec2.x - vec1.x * vec2.z;
	resVec.z = vec1.x * vec2.y - vec1.y * vec2.x;
	return resVec;
end;

function Vector3.equal(vec1,vec2)
	if math.abs(vec1.x - vec2.x) > 0.00001 then
		return false;
	elseif math.abs(vec1.y - vec2.y) > 0.00001 then
		return false;
	elseif math.abs(vec1.z - vec2.z) > 0.00001 then
		return false;
	end;
	return true;
end;