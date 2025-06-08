unit udmMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLite3Conn, SQLDB;

type

  { TdmMain }

  TdmMain = class(TDataModule)
    DataSource1: TDataSource;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private

  public

  end;

var
  dmMain: TdmMain;

implementation

{$R *.lfm}

end.

