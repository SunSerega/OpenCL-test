## uses OpenCLABC;

try
  Rewrite(output, 'test otp.txt', new System.Text.UTF8Encoding(true));
  
  $'CPU имеет {System.Environment.ProcessorCount} ядер'.Println;
  
  foreach var pl in CLPlatform.All ?? System.Array.Empty&<CLPlatform> do
  begin
    Println(TypeName(pl));
    Println(pl.Properties);
    foreach var dvc in CLDevice.GetAllFor(pl, CLDeviceType.DEVICE_TYPE_ALL) ?? System.Array.Empty&<CLDevice> do
    begin
      Println(TypeName(dvc));
      Println(dvc.Properties);
      Println('~'*30);
    end;
    Println('='*30);
  end;
  output.Close;
except
  on e: Exception do
  begin
    Console.WriteLine(e);
    Halt(-1);
  end;
end;

'Done'.Println;