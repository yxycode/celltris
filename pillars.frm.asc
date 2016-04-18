VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3675
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5265
   Icon            =   "pillars.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   245
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   351
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   240
      Top             =   3000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False




Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

  Const KEYCODE_UP As Integer = 38
  Const KEYCODE_DOWN As Integer = 40
  Const KEYCODE_LEFT As Integer = 37
  Const KEYCODE_RIGHT As Integer = 39
  Const KEYCODE_D As Integer = 68
  Const KEYCODE_F As Integer = 70
  Const KEYCODE_Q As Integer = 81
  
  Const KEYCODE_0 As Integer = 48
  Const KEYCODE_1 As Integer = 49
  Const KEYCODE_2 As Integer = 50
  Const KEYCODE_3 As Integer = 51
  Const KEYCODE_4 As Integer = 52
  Const KEYCODE_5 As Integer = 53
  Const KEYCODE_6 As Integer = 54
  Const KEYCODE_7 As Integer = 55
  Const KEYCODE_8 As Integer = 56
  Const KEYCODE_9 As Integer = 57
  Const KEYCODE_ENTER As Integer = 13
  Const KEYCODE_SPACEBAR As Integer = 32
  Const KEYCODE_ESC As Integer = 27
  Const KEYCODE_F1 As Integer = 112
  
  Select Case KeyCode
     Case KEYCODE_UP:
        RotateRightFlag = 1
     Case KEYCODE_DOWN:
        DropFlag = 1
     Case KEYCODE_LEFT:
        MoveLeftFlag = 1
     Case KEYCODE_RIGHT:
        MoveRightFlag = 1
     Case KEYCODE_D:
        RotateLeftFlag = 1
     Case KEYCODE_F:
        RotateRightFlag = 1
     Case KEYCODE_0:
        Option_Flag_List(0) = 1
     Case KEYCODE_1:
        Option_Flag_List(1) = 1
     Case KEYCODE_2:
        Option_Flag_List(2) = 1
     Case KEYCODE_3:
        Option_Flag_List(3) = 1
     Case KEYCODE_4:
        Option_Flag_List(4) = 1
     Case KEYCODE_5:
        Option_Flag_List(5) = 1
     Case KEYCODE_6:
        Option_Flag_List(6) = 1
     Case KEYCODE_7:
        Option_Flag_List(7) = 1
     Case KEYCODE_8:
        Option_Flag_List(8) = 1
     Case KEYCODE_9:
        Option_Flag_List(9) = 1
     Case KEYCODE_ENTER:
        Option_Running_Flag = 1
     Case KEYCODE_SPACEBAR:
        Option_Running_Flag = 1
     Case KEYCODE_Q:
        Option_Paused_Flag = 1
     Case KEYCODE_F1:
        Difficulty_Change_Flag = 1
     Case KEYCODE_ESC:
        ' *** end the program ***
        AzClose
        Unload Form1
        End
  End Select
  
  KeyPressFlag = 1
  UserInteraction
  UserInteraction2
  
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

  Const KEYCODE_UP As Integer = 38
  Const KEYCODE_DOWN As Integer = 40
  Const KEYCODE_LEFT As Integer = 37
  Const KEYCODE_RIGHT As Integer = 39
  Const KEYCODE_D As Integer = 68
  Const KEYCODE_F As Integer = 70
  Const KEYCODE_Q As Integer = 81
  
  Const KEYCODE_0 As Integer = 48
  Const KEYCODE_1 As Integer = 49
  Const KEYCODE_2 As Integer = 50
  Const KEYCODE_3 As Integer = 51
  Const KEYCODE_4 As Integer = 52
  Const KEYCODE_5 As Integer = 53
  Const KEYCODE_6 As Integer = 54
  Const KEYCODE_7 As Integer = 55
  Const KEYCODE_8 As Integer = 56
  Const KEYCODE_9 As Integer = 57
  Const KEYCODE_ENTER As Integer = 13
  Const KEYCODE_SPACEBAR As Integer = 32
  Const KEYCODE_ESC As Integer = 27
  Const KEYCODE_F1 As Integer = 112
  
  Select Case KeyCode
     Case KEYCODE_UP:
        RotateRightFlag = 0
     Case KEYCODE_DOWN:
        DropFlag = 0
     Case KEYCODE_LEFT:
        MoveLeftFlag = 0
     Case KEYCODE_RIGHT:
        MoveRightFlag = 0
     Case KEYCODE_D:
        RotateLeftFlag = 0
     Case KEYCODE_F:
        RotateRightFlag = 0
     Case KEYCODE_0:
        Option_Flag_List(0) = 0
     Case KEYCODE_1:
        Option_Flag_List(1) = 0
     Case KEYCODE_2:
        Option_Flag_List(2) = 0
     Case KEYCODE_3:
        Option_Flag_List(3) = 0
     Case KEYCODE_4:
        Option_Flag_List(4) = 0
     Case KEYCODE_5:
        Option_Flag_List(5) = 0
     Case KEYCODE_6:
        Option_Flag_List(6) = 0
     Case KEYCODE_7:
        Option_Flag_List(7) = 0
     Case KEYCODE_8:
        Option_Flag_List(8) = 0
     Case KEYCODE_9:
        Option_Flag_List(9) = 0
     Case KEYCODE_ENTER:
        Option_Running_Flag = 0
     Case KEYCODE_SPACEBAR:
        Option_Running_Flag = 0
     Case KEYCODE_Q:
        Option_Paused_Flag = 0
     Case KEYCODE_F1:
        Difficulty_Change_Flag = 0
  End Select
    
  KeyPressFlag = 0
  
End Sub

Private Sub Form_Load()

InitGame Form1.hwnd
InitializeShapeShapes
CurrentGameState = GAME_STATE_BEGIN

End Sub

Private Sub Form_Resize()

Dim Xr!, Yr!

   Xr = Form1.Width / Form1.ScaleWidth
   Yr = Form1.Height / Form1.ScaleHeight

   Form1.Width = GameResolutionX * Xr
   Form1.Height = GameResolutionY * Yr
   
   Form1.Top = Screen.Height / 2 - Form1.Height / 2
   Form1.Left = Screen.Width / 2 - Form1.Width / 2


End Sub

Private Sub Timer1_Timer()

Dim RefreshFlag As Boolean
Dim XOld%, YOld%
Dim LinesFormedCount%
RefreshFlag = False

If CurrentGameState = GAME_STATE_BEGIN Then

  If TimeDelay() Then
    DrawWallsStaticPlayField
    CopyStaticPlayField2OutputPlayField
    DisplayGameInfoNextShape
    DrawOutputPlayField2BufferText
    DisplayGameInfo
    DisplayGameStateMessage GAME_STATE_BEGIN
    Bitmap_Buffer2Window Form1.hDC
  End If
  
ElseIf CurrentGameState = GAME_STATE_GAME_OVER Then

 If TimeDelay() Then
    DrawWallsStaticPlayField
    CopyStaticPlayField2OutputPlayField
    DisplayGameInfoNextShape
    DrawOutputPlayField2BufferText
    DisplayGameInfo
    DisplayGameStateMessage GAME_STATE_GAME_OVER
    
    If CurrentScore > HighScore Then
       HighScore = CurrentScore
       DoHighScore 2
    End If
    
    Bitmap_Buffer2Window Form1.hDC
 End If
 
ElseIf CurrentGameState = GAME_STATE_PAUSED Then

 If TimeDelay() Then
    DrawWallsStaticPlayField
    CopyStaticPlayField2OutputPlayField
    DisplayGameInfoNextShape
    DrawShape2OutputPlayField CurrentShape
    DrawOutputPlayField2BufferText
    DisplayGameInfo
    DisplayGameStateMessage GAME_STATE_PAUSED
    
    ' display game paused message and info window
    ' get input to resume
    Bitmap_Buffer2Window Form1.hDC
 End If
 
ElseIf CurrentGameState = GAME_STATE_RUNNING Then
    
If PausePlayAnimationStateFlag = 0 Then
  
   CellClearChainCount = 0
   
If InstantDropFlag Then
   InstantDrop
   InstantDropFlag = 0
End If

XOld = CurrentShape.X
YOld = CurrentShape.Y

If DropShape Or KeyPressFlag Then
   RefreshFlag = True
End If

If CheckShapeCollideStaticPlayField Then
   
   CurrentShape.X = XOld
   CurrentShape.Y = YOld

   PasteShape2StaticPlayField
  
   StartRandomShapeFlag = 1
   
   Add2ScoreHitBottom
   
   LinesFormedCount = CheckFormLines
   
   If LinesFormedCount > 0 Then
      CellClearChainCount = CellClearChainCount + 1
      Add2ScorePillarsClear LinesFormedCount, CellClearChainCount
   End If
      
   IncreaseSpeed
  
End If

If StartRandomShapeFlag Then
   StartRandomShapeFlag = 0
   StartRandomShape
   
   If CheckShapeCollideStaticPlayField Then
      CurrentGameState = GAME_STATE_GAME_OVER
   End If
   
End If

Else
  
   If AnimationDelay Then
      RefreshFlag = True
      ClearDeletePlayField
      ShiftBlocksDown
   End If
   
End If

If RefreshFlag Then
    LinesFormedCount = CheckFormLines
    
    If LinesFormedCount > 0 Then
       CellClearChainCount = CellClearChainCount + 1
       Add2ScorePillarsClear LinesFormedCount, CellClearChainCount
    End If
       
    IncreaseSpeed
End If

DrawWallsStaticPlayField
CopyStaticPlayField2OutputPlayField
    
DrawShape2OutputPlayField CurrentShape

DisplayGameInfoNextShape

If RefreshFlag Then

    DrawOutputPlayField2BufferText
    DisplayGameInfo

    Bitmap_Buffer2Window Form1.hDC
           
End If

ClearOutputPlayField

End If

End Sub
