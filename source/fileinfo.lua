local cjson = require "cjson";

local FileInfo = {};

function FileInfo.new(file, metaDir)
	local self = {};
	self.file = file;
	self.metaDir = metaDir;
	self.meta = {};

	self.set = function (self, key, value)
		if(self.meta[key] and not value) then
			return self.meta[key];
		end;
		if(value) then
			self.meta[key] = value;
		end;
	end;

	self.save = function (self)
		local metaPath = self.metaDir .. '/' .. self.file .. '.info.json';
		local metaFile = io.open(metaPath, 'w');
		print (metaPath);
		metaFile:write(cjson.encode(self.meta));
		metaFile:close();
	end;

	return self;
end;

return FileInfo;

