function __DIR__()
	local path = debug.getinfo(2,'S').source:match("@?(.*/)");
	if(path) then return path; end;
	return '';
end;

function import(file)
	return require(__DIR__() .. file);
end;

local Log      = import("log");
local FileInfo = import("fileinfo");

require 'lfs';

Log:write("Script starting.");

local uploadDir = '/home/sean/dcim_test/';
local infoDir   = './' .. __DIR__() .. '../data/fileinfo/';

Log:write("Checking dir '" .. uploadDir .. '"...');

for file in lfs.dir(uploadDir) do
	if(string.sub(file, 1, 1) ~= '.') then
		Log:write("Checking file '" .. uploadDir .. file .. '".');
		fileInfo = FileInfo.new(file, uploadDir, infoDir);

		if(not fileInfo.meta.exists) then
			Log:write("Uploading '" .. uploadDir .. file .. '".');
		end;

		fileInfo:save();
	end;
end;

Log:write("Script Completed.\n");
