program LuaTest;
{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  Lua in '..\Lib\Lua.pas',
  LuaLib in '..\Lib\LuaLib.pas',
  MyLua in 'MyLua.pas';

var
  MyLua: TLua;

begin
  try

    // Create new Lua and autoregister new function
    MyLua := TMyLua.Create;
    MyLua.DoFile('Helloworld.lua');
    MyLua.Free;

    writeln;

    // Manually register new lua functions
    MyLua := TMyLua.Create(False);
    MyLua.RegisterFunction('HelloWorld');
    MyLua.RegisterFunction('HelloWorld2');
    MyLua.RegisterFunction('HelloWorld3','HelloWorld4');
    MyLua.DoFile('Helloworld.lua');
    MyLua.Free;

    readln;

  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
end.
