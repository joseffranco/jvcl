{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExMask.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvExMask;

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

interface

uses
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, Mask,
  {$ENDIF VCL}
  {$IFDEF COMPILER6_UP}
  Types,
  {$ENDIF COMPILER6_UP}
  {$IFDEF VisualCLX}
  Qt, QGraphics, QControls, QForms, QMask, Types, QWindows,
  {$ENDIF VisualCLX}
  Classes, SysUtils,
  JvTypes, JvThemes, JVCLVer, JvExControls;

{$IFDEF VCL}
 {$DEFINE NeedMouseEnterLeave}
{$ENDIF VCL}
{$IFDEF VisualCLX}
 {$IF not declared(PatchedVCLX)}
  {$DEFINE NeedMouseEnterLeave}
 {$IFEND}
{$ENDIF VisualCLX}

type
  TJvExCustomMaskEdit = class(TCustomMaskEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  // IJvControlEvents
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    InternalFontChanged: TNotifyEvent;
    procedure OnFontChanged(Sender: TObject);
  protected
    procedure BoundsChanged; override;
    procedure DoFontChanged(Sender: TObject); dynamic;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure PaintWindow(PaintDevice: QPaintDeviceH);
    function WidgetFlags: Integer; override;
    procedure CreateWnd; dynamic;
    procedure CreateWidget; override;
    procedure RecreateWnd;
  public
    procedure PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
  published
    property DoubleBuffered: Boolean read FDoubleBuffered write FDoubleBuffered;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisualCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  private
    FClipboardCommands: TJvClipboardCommands;
    {$IFDEF VisualCLX}
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    {$ENDIF VisualCLX}
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  {$IFDEF VisualCLX}
  public
    procedure Clear; override;
  {$ENDIF VisualCLX}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FBeepOnError: Boolean;
  protected
    procedure DoBeepOnError; dynamic;
    procedure SetBeepOnError(Value: Boolean); virtual;
    property BeepOnError: Boolean read FBeepOnError write SetBeepOnError default True;
  end;

  TJvExPubCustomMaskEdit = class(TJvExCustomMaskEdit)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  

  TJvExMaskEdit = class(TMaskEdit,  IJvEditControlEvents, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  // IJvControlEvents
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    InternalFontChanged: TNotifyEvent;
    procedure OnFontChanged(Sender: TObject);
  protected
    procedure BoundsChanged; override;
    procedure DoFontChanged(Sender: TObject); dynamic;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure PaintWindow(PaintDevice: QPaintDeviceH);
    function WidgetFlags: Integer; override;
    procedure CreateWnd; dynamic;
    procedure CreateWidget; override;
    procedure RecreateWnd;
  public
    procedure PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
  published
    property DoubleBuffered: Boolean read FDoubleBuffered write FDoubleBuffered;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisualCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  private
    FClipboardCommands: TJvClipboardCommands;
    {$IFDEF VisualCLX}
    FEditRect: TRect; // EM_GETRECT
    procedure EMGetRect(var Msg: TMessage); message EM_GETRECT;
    procedure EMSetRect(var Msg: TMessage); message EM_SETRECT;
    {$ENDIF VisualCLX}
  protected
    procedure DoUndo; dynamic;
    procedure DoClearText; dynamic;
    procedure DoClipboardPaste; dynamic;
    procedure DoClipboardCopy; dynamic;
    procedure DoClipboardCut; dynamic;
    procedure SetClipboardCommands(const Value: TJvClipboardCommands); virtual;
    property ClipboardCommands: TJvClipboardCommands read FClipboardCommands
      write SetClipboardCommands default [caCopy..caUndo];
  {$IFDEF VisualCLX}
  public
    procedure Clear; override;
  {$ENDIF VisualCLX}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FBeepOnError: Boolean;
  protected
    procedure DoBeepOnError; dynamic;
    procedure SetBeepOnError(Value: Boolean); virtual;
    property BeepOnError: Boolean read FBeepOnError write SetBeepOnError default True;
  end;

  TJvExPubMaskEdit = class(TJvExMaskEdit)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  

implementation

{$IFDEF UNITVERSIONING}
uses
  JclUnitVersioning;
{$ENDIF UNITVERSIONING}

{ The CONSTRUCTOR_CODE macro is used to extend the constructor by the macro
  content. }
{$UNDEF CONSTRUCTOR_CODE}
{$DEFINE CONSTRUCTOR_CODE
  FBeepOnError := True;
  FClipboardCommands := [caCopy..caUndo];
}
{$IFDEF VCL}
procedure TJvExCustomMaskEdit.Dispatch(var Msg);
asm
        JMP     DispatchMsg
end;

procedure TJvExCustomMaskEdit.VisibleChanged;
asm
        MOV     EDX, CM_VISIBLECHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.EnabledChanged;
asm
        MOV     EDX, CM_ENABLEDCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.TextChanged;
asm
        MOV     EDX, CM_TEXTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.FontChanged;
asm
        MOV     EDX, CM_FONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ColorChanged;
asm
        MOV     EDX, CM_COLORCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ParentFontChanged;
asm
        MOV     EDX, CM_PARENTFONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ParentShowHintChanged;
asm
        MOV     EDX, CM_PARENTSHOWHINTCHANGED
        JMP     InheritMsg
end;

function TJvExCustomMaskEdit.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCustomMaskEdit.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCustomMaskEdit.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCustomMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExCustomMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExCustomMaskEdit.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCustomMaskEdit.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCustomMaskEdit.CursorChanged;
asm
        MOV     EDX, CM_CURSORCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ShowHintChanged;
asm
        MOV     EDX, CM_SHOWHINTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ShowingChanged;
asm
        MOV     EDX, CM_SHOWINGCHANGED
        JMP     InheritMsg
end;

procedure TJvExCustomMaskEdit.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanging
end;

procedure TJvExCustomMaskEdit.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCustomMaskEdit.GetParentBackground: Boolean;
asm
        JMP     JvThemes.GetParentBackground
end;

procedure TJvExCustomMaskEdit.SetParentBackground(Value: Boolean);
asm
        JMP     JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
  
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExCustomMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCustomMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCustomMaskEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCustomMaskEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCustomMaskEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCustomMaskEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
function TJvExCustomMaskEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := WidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCustomMaskEdit.OnFontChanged(Sender: TObject);
var
  FontChangedEvent: QEventH;
begin
  FontChangedEvent := QEvent_create(QEventType_FontChanged);
  if FontChangedEvent <> nil then
    QApplication_postEvent(Handle, FontChangedEvent);
end;

procedure TJvExCustomMaskEdit.DoFontChanged(Sender: TObject);
begin
  if Assigned(InternalFontChanged) then
    InternalFontChanged(Self);
end;

procedure TJvExCustomMaskEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExCustomMaskEdit.RecreateWnd;
begin
  RecreateWidget;
end;

procedure TJvExCustomMaskEdit.CreateWidget;
begin
  CreateWnd;
end;

procedure TJvExCustomMaskEdit.CreateWnd;
begin
  inherited CreateWidget;
end;

function TJvExCustomMaskEdit.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags or
    Integer(WidgetFlags_WRepaintNoErase) or
    Integer(WidgetFlags_WMouseNoMask);
end;

function TJvExCustomMaskEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  Result := Result or WidgetControl_EventFilter(Self, Sender, Event);
end;

procedure TJvExCustomMaskEdit.PaintWindow(PaintDevice: QPaintDeviceH);
begin
  WidgetControl_PaintTo(Self, PaintDevice, 0, 0);
end;

procedure TJvExCustomMaskEdit.PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
begin
  WidgetControl_PaintTo(Self, PaintDevice, X, Y);
end;
  
{$ENDIF VisualCLX}
procedure TJvExCustomMaskEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCustomMaskEdit.DoFocusChanged(Control: TWinControl);
begin
end;
  
procedure TJvExCustomMaskEdit.DoBoundsChanged;
begin
end;

procedure TJvExCustomMaskEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCustomMaskEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCustomMaskEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCustomMaskEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
        JMP     DefaultDoPaintBackground
end;
  
constructor TJvExCustomMaskEdit.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  {$IFDEF VisualCLX}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  InternalFontChanged := Font.OnChange;
  Font.OnChange := OnFontChanged;
  {$ENDIF VisualCLX}
  FHintColor := Application.HintColor;
  FBeepOnError := True;
  FClipboardCommands := [caCopy..caUndo];
end;

{$IFDEF VisualCLX}
procedure TJvExCustomMaskEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

procedure TJvExCustomMaskEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}

destructor TJvExCustomMaskEdit.Destroy;
begin
  inherited Destroy;
end;
  
procedure TJvExCustomMaskEdit.DoClearText;
begin
  // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    {$IFDEF VCL}
    InheritMsg(Self, WM_CLEAR);
    {$ENDIF VCL}
    {$IFDEF VisualCLX}
    inherited Clear;
    {$ENDIF VisualCLX}
end;

procedure TJvExCustomMaskEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExCustomMaskEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExCustomMaskEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExCustomMaskEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExCustomMaskEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;

{$IFDEF VisualCLX}

procedure TJvExCustomMaskEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExCustomMaskEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
end;

procedure TJvExCustomMaskEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;

{$ENDIF VisualCLX}

procedure TJvExCustomMaskEdit.DoBeepOnError;
begin
  if FBeepOnError then
    SysUtils.Beep;
end;

procedure TJvExCustomMaskEdit.SetBeepOnError(Value: Boolean);
begin
  FBeepOnError := Value;
end;



{$IFDEF VCL}
procedure TJvExMaskEdit.Dispatch(var Msg);
asm
        JMP     DispatchMsg
end;

procedure TJvExMaskEdit.VisibleChanged;
asm
        MOV     EDX, CM_VISIBLECHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.EnabledChanged;
asm
        MOV     EDX, CM_ENABLEDCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.TextChanged;
asm
        MOV     EDX, CM_TEXTCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.FontChanged;
asm
        MOV     EDX, CM_FONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ColorChanged;
asm
        MOV     EDX, CM_COLORCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ParentFontChanged;
asm
        MOV     EDX, CM_PARENTFONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ParentShowHintChanged;
asm
        MOV     EDX, CM_PARENTSHOWHINTCHANGED
        JMP     InheritMsg
end;

function TJvExMaskEdit.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExMaskEdit.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExMaskEdit.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor,
    FOnMouseEnter);
end;

procedure TJvExMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor, FOnMouseLeave);
end;

procedure TJvExMaskEdit.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExMaskEdit.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExMaskEdit.CursorChanged;
asm
        MOV     EDX, CM_CURSORCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ShowHintChanged;
asm
        MOV     EDX, CM_SHOWHINTCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ShowingChanged;
asm
        MOV     EDX, CM_SHOWINGCHANGED
        JMP     InheritMsg
end;

procedure TJvExMaskEdit.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanging
end;

procedure TJvExMaskEdit.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExMaskEdit.GetParentBackground: Boolean;
asm
        JMP     JvThemes.GetParentBackground
end;

procedure TJvExMaskEdit.SetParentBackground(Value: Boolean);
asm
        JMP     JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
  
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExMaskEdit.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FSavedHintColor, FHintColor);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExMaskEdit.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FSavedHintColor);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExMaskEdit.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExMaskEdit.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExMaskEdit.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExMaskEdit.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
function TJvExMaskEdit.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := WidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExMaskEdit.OnFontChanged(Sender: TObject);
var
  FontChangedEvent: QEventH;
begin
  FontChangedEvent := QEvent_create(QEventType_FontChanged);
  if FontChangedEvent <> nil then
    QApplication_postEvent(Handle, FontChangedEvent);
end;

procedure TJvExMaskEdit.DoFontChanged(Sender: TObject);
begin
  if Assigned(InternalFontChanged) then
    InternalFontChanged(Self);
end;

procedure TJvExMaskEdit.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;

procedure TJvExMaskEdit.RecreateWnd;
begin
  RecreateWidget;
end;

procedure TJvExMaskEdit.CreateWidget;
begin
  CreateWnd;
end;

procedure TJvExMaskEdit.CreateWnd;
begin
  inherited CreateWidget;
end;

function TJvExMaskEdit.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags or
    Integer(WidgetFlags_WRepaintNoErase) or
    Integer(WidgetFlags_WMouseNoMask);
end;

function TJvExMaskEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  Result := Result or WidgetControl_EventFilter(Self, Sender, Event);
end;

procedure TJvExMaskEdit.PaintWindow(PaintDevice: QPaintDeviceH);
begin
  WidgetControl_PaintTo(Self, PaintDevice, 0, 0);
end;

procedure TJvExMaskEdit.PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
begin
  WidgetControl_PaintTo(Self, PaintDevice, X, Y);
end;
  
{$ENDIF VisualCLX}
procedure TJvExMaskEdit.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExMaskEdit.DoFocusChanged(Control: TWinControl);
begin
end;
  
procedure TJvExMaskEdit.DoBoundsChanged;
begin
end;

procedure TJvExMaskEdit.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExMaskEdit.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExMaskEdit.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExMaskEdit.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
        JMP     DefaultDoPaintBackground
end;
  
constructor TJvExMaskEdit.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  {$IFDEF VisualCLX}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  InternalFontChanged := Font.OnChange;
  Font.OnChange := OnFontChanged;
  {$ENDIF VisualCLX}
  FHintColor := Application.HintColor;
  FBeepOnError := True;
  FClipboardCommands := [caCopy..caUndo];
end;

{$IFDEF VisualCLX}
procedure TJvExMaskEdit.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

procedure TJvExMaskEdit.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}

destructor TJvExMaskEdit.Destroy;
begin
  inherited Destroy;
end;
  
procedure TJvExMaskEdit.DoClearText;
begin
  // (ahuser) there is no caClear so we restrict it to caCut
  if caCut in ClipboardCommands then
    {$IFDEF VCL}
    InheritMsg(Self, WM_CLEAR);
    {$ENDIF VCL}
    {$IFDEF VisualCLX}
    inherited Clear;
    {$ENDIF VisualCLX}
end;

procedure TJvExMaskEdit.DoUndo;
begin
  if caUndo in ClipboardCommands then
    TCustomEdit_Undo(Self);
end;

procedure TJvExMaskEdit.DoClipboardPaste;
begin
  if caPaste in ClipboardCommands then
    TCustomEdit_Paste(Self);
end;

procedure TJvExMaskEdit.DoClipboardCopy;
begin
  if caCopy in ClipboardCommands then
    TCustomEdit_Copy(Self);
end;

procedure TJvExMaskEdit.DoClipboardCut;
begin
  if caCut in ClipboardCommands then
    TCustomEdit_Cut(Self);
end;

procedure TJvExMaskEdit.SetClipboardCommands(const Value: TJvClipboardCommands);
begin
  FClipboardCommands := Value;
end;

{$IFDEF VisualCLX}

procedure TJvExMaskEdit.Clear;
begin
  DoClearText;
end;

procedure TJvExMaskEdit.EMGetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    if IsRectEmpty(FEditRect) then
    begin
      PRect(Msg.LParam)^ := ClientRect;
      if Self.BorderStyle = bsSingle then
        InflateRect(PRect(Msg.LParam)^, -2, -2);
    end
    else
      PRect(Msg.LParam)^ := FEditRect;
end;

procedure TJvExMaskEdit.EMSetRect(var Msg: TMessage);
begin
  if Msg.LParam <> 0 then
    FEditRect := PRect(Msg.LParam)^
  else
    FEditRect := ClientRect;
  Invalidate;
end;

{$ENDIF VisualCLX}

procedure TJvExMaskEdit.DoBeepOnError;
begin
  if FBeepOnError then
    SysUtils.Beep;
end;

procedure TJvExMaskEdit.SetBeepOnError(Value: Boolean);
begin
  FBeepOnError := Value;
end;


{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$RCSfile$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\run'
  );

initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

{$UNDEF CONSTRUCTOR_CODE} // undefine at file end

end.
