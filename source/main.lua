function __DIR__()
	local path = debug.getinfo(2,'S').source:match("@?(.*/)");
	if(path) then return path; end;
	return '';
end
function __FILE__() return debug.getinfo(2,'S').source end
function __LINE__() return debug.getinfo(2, 'l').currentline end
function __FUNC__() return debug.getinfo(1).name end

function pos()
    print("Line at "..__LINE__()..", FILE at "..__FILE__()..", in func: "..__FUNC__())
end

function import(file)
	return require(__DIR__() .. file);
end;

local Log = import("log");
local FileInfo = import("fileinfo");

require 'lfs';

Log:write("Script starting.");

local uploadDir = '/home/sean/dcim_test';
local infoDir   = '/home/sean/flashair/data/fileinfo';

for file in lfs.dir(uploadDir) do
	if(not string.sub(file, 1, 1) == '.') then
		fileInfo = FileInfo.new(file, '/home/sean/flashair/data/fileinfo/');
		fileInfo:set('check', os.time());
		fileInfo:save();
	end;
end;
