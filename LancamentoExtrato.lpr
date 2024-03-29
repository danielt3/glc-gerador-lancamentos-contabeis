program LancamentoExtrato;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unPrincipal, zcomponent, unDataModule, unListaCodigo,
  unGarbageCollector, unUtilitario, lazcontrols, runtimetypeinfocontrols,
  lazutils, laz_fpspreadsheet, weblaz, unApresentacao, unNovoCampo, unConsultar,
  unConsultarPlanoContas, MemoryTable, unStringGridController;

{$R *.res}

begin
  Application.Title:='Soleil';
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmNovoCampo, frmNovoCampo);
  Application.CreateForm(TfrmConsultar, frmConsultar);
  Application.CreateForm(TfrmConsultarPlanoContas, frmConsultarPlanoContas);
  Application.Run;
end.

