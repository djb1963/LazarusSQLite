unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, Buttons,
  DBGrids, ExtCtrls, StdCtrls, DBCtrls, udmMain;

type

  { TfmMain }

  TfmMain = class(TForm)
    bbOpen: TBitBtn;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    edSQL: TEdit;
    FileNameEdit1: TFileNameEdit;
    laSQL: TLabel;
    laDB: TLabel;
    paTop: TPanel;
    procedure bbOpenClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure edSQLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FileNameEdit1AcceptFileName(Sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
begin

end;

procedure TfmMain.FileNameEdit1AcceptFileName(Sender: TObject; var Value: String
  );
begin
  dmMain.SQLite3Connection1.DatabaseName:=Value;
end;

procedure TfmMain.bbOpenClick(Sender: TObject);
begin
  dmMain.SQLQuery1.Close;
  dmMain.SQLQuery1.SQL.Text:=edSQL.Text;

  dmMain.SQLite3Connection1.Open;
  dmMain.SQLQuery1.Open;
  DBGrid1.SetFocus;
end;

procedure TfmMain.DBGrid1ColEnter(Sender: TObject);
begin
////  if DBMemo1.Visible then begin
  if (Sender as TDBGrid).DataSource.DataSet.Active then begin
     DBMemo1.DataField:=(Sender as TDBGrid).SelectedField.FieldName;
  end;
end;

procedure TfmMain.edSQLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then bbOpen.Click;
end;

end.

