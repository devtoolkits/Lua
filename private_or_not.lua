local current_remote_addr = "192.168.1.1"

local ip_decimal = 0
local postion = 3
for i in string.gmatch(current_remote_addr, [[%d+]]) do
    ip_decimal = ip_decimal + math.pow(256, postion) * i
    postion = postion - 1
end

if ip_decimal >= 0x7f000000 and ip_decimal <= 0x7fffffff or -- 127.0.0.0 ~ 127.255.255.255
    ip_decimal >= 0x0a000000 and ip_decimal <= 0x0affffff or -- 10.0.0.0 ~ 10.255.255.255
    ip_decimal >= 0xac100000 and ip_decimal <= 0xac1fffff or -- 172.16.0.0 ~ 172.31.255.255
    ip_decimal >= 0xc0a80000 and ip_decimal <= 0xc0a8ffff then   -- 192.168.0.0 ~ 192.168.255.255
    print(current_remote_addr.." is a private ip")
else
    print(current_remote_addr.." is not a private ip")
end
