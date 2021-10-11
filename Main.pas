unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 d: _devicemodeA;
 i: integer;
begin
 i:=0;
 while EnumDisplaySettings(nil,i,d)<>false do
  begin
   ListBox1.Items.Add('Mode: '+IntToStr(i+1)+' - '+FloatToStr(D.dmPelsWidth)+'x'+FloatToStr(D.dmPelsHeight)+'x'+FloatToStr(D.dmBitsPerPel)+' - '+FloatToStr(D.dmDisplayFrequency)+' Hz');
   inc(i,1);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 d: _devicemodeA;
begin
 EnumDisplaySettings(nil, ListBox1.ItemIndex, D);
 ChangeDisplaySettings(D, CDS_UPDATEREGISTRY);
end;

end.
