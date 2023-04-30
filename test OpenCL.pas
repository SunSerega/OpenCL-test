﻿## uses OpenCLABC;

try
  foreach var pl in CLPlatform.All do
  begin
    Println(pl);
    Println(pl.Properties);
    foreach var dvc in CLDevice.GetAllFor(pl, CLDeviceType.DEVICE_TYPE_ALL) ?? System.Array.Empty&<CLDevice> do
    begin
      Println(dvc);
      Println(dvc.Properties);
      Println('~'*30);
    end;
    Println('='*30);
  end;
except
  on e: Exception do
  begin
    Println(e);
    Halt(-1);
  end;
end;

'Done'.Println;