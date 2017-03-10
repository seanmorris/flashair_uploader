local Log= {};
local logDir = __DIR__() .. '../logs/';
local logFile = logDir .. 'log.txt';
local log = io.open (logFile, 'a');
math.randomseed(os.time());
local logId = math.random(1000,9999)
local function write(self, line)
	log:write(string.format(
		"[%d]::[%d]\t%s\n"
		, os.time()
		, logId
		, line
	));
end;
Log.write = write;
return Log;
