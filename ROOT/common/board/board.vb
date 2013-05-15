Const IDM_NEW		= 40003
const IDM_OPEN		= 40004
const IDM_SAVE		= 40007
const IDM_PRINT		= 40006
const IDM_PRINT_PREVIEW	= 40026

const IDM_UNDO		= 40013
const IDM_REDO		= 40016
const IDM_FIND		= 40018
const IDM_REPLACE		= 40019

const IDM_INSERT_HR		= 40020
const IDM_INSERT_IMAGE	= 40032
const IDM_INSERT_COMMENT	= 40038
const IDM_INSERT_SYMBOL	= 40072
const IDM_INSERT_SCRIPT	= 40100
const IDM_INSERT_UNKNOWN_TAG = 40101
const IDM_INSERT_APPLET	= 40104
const IDM_INSERT_PLUGIN	= 40166

const IDM_CHAR_BOLD		= 40042
const IDM_CHAR_ITALIC		= 40043
const IDM_CHAR_UNDERLINE	= 40044
const IDM_CHAR_CLEAR		= 40046
const IDM_CHAR_COLOR	= 40047

const IDM_LIST_NUMBERED	= 40052
const IDM_LIST_BULLET		= 40053

const IDM_INDENT_DECREASE	= 40055
const IDM_INDENT_INCREASE	= 40054

const IDM_ALIGN_LEFT		= 40049
const IDM_ALIGN_CENTER	= 40050
const IDM_ALIGN_RIGHT		= 40051

const IDM_HYPERLINK		= 40034
const IDM_NEW_TABLE_RIBBON	= 40129

const IDM_FORM_ONELINE_TXTBOX = 40059
const IDM_FORM_TXTBOX	= 40060
const IDM_FORM_CHECKBOX	= 40061
const IDM_FORM_RADIOBTN	= 40062
const IDM_FORM_MENU		= 40063
const IDM_FORM_PUSHBTN	= 40064
const IDM_FORM_IMAGE		= 40099

const IDM_PARA_COMBOBOX	= 40039
const IDM_FONT_COMBOBOX	= 40105
const IDM_FONTSIZE_COMBOBOX = 40164

const IDM_VIEW_SOURCE	= 40035
const IDM_LINESPACING		= 40224
const IDM_MENU		= 40229

const IDM_SHOWHIDE_TAG_MARK = 40068
const IDM_SHOWHIDE_PARA_MARK = 40058
const IDM_SHOWHIDE_SPACE_MARK = 40178

Dim strMIME
Function Window_OnLoad
	On Error Resume Next
	Dim fRef
	Dim buf
	Set fRef = document.forms(0)

	fRef.siba.SetToolbarContents2 0, Array(IDM_MENU, 0, IDM_NEW, IDM_OPEN, IDM_SAVE, 0, IDM_PRINT, 0, IDM_UNDO, IDM_REDO, 0, IDM_INSERT_HR, IDM_HYPERLINK, IDM_INSERT_IMAGE, IDM_NEW_TABLE_RIBBON, 0, IDM_INSERT_SYMBOL, IDM_INSERT_COMMENT, 0, IDM_FIND, IDM_REPLACE, 0, IDM_VIEW_SOURCE, 0, IDM_SHOWHIDE_TAG_MARK, IDM_SHOWHIDE_PARA_MARK, IDM_SHOWHIDE_SPACE_MARK)
	fRef.siba.SetToolbarContents2 1, Array(0, IDM_PARA_COMBOBOX, 0, IDM_FONT_COMBOBOX, 0, IDM_FONTSIZE_COMBOBOX, 0, IDM_CHAR_BOLD, IDM_CHAR_ITALIC, IDM_CHAR_UNDERLINE, IDM_CHAR_COLOR, 0, IDM_LIST_NUMBERED, IDM_LIST_BULLET,IDM_INDENT_DECREASE, IDM_INDENT_INCREASE, 0, IDM_ALIGN_LEFT,IDM_ALIGN_CENTER, IDM_ALIGN_RIGHT, 0, IDM_LINESPACING)
	fRef.siba.ShowToolbar 0, TRUE
	fRef.siba.ShowToolbar 1, TRUE
	fRef.siba.LineSpacing = 120
	fRef.siba.SetBasicFont "Arial", 2
	fRef.siba.SetPaperSize(1)
	'MsgBox fRef.contents.Value

	If Len(Trim(fRef.contents.Value)) > 0  THEN
	'	buf=""
	'	buf =fRef.contents.Value
	'	if Err.number > 0 then
	'		buf = " "
	'	else
	'		if IsEmpty(buf) then
	'			fRef.siba.Value = ""
	'		else
	'			fRef.siba.Value = cStr(buf)
	'		end if
	'	end if
	'	fRef.contents.value = ""
	'Else
		fRef.siba.Value = fRef.contents.Value
	End IF
	Window_OnLoad = TRUE
End Function

Sub siba_DocInitCompleted()
	Dim fRef
	Set fRef = document.forms(0)

	fRef.siba.SetBasicFont "Arial", 2
	fRef.siba.SetPaperSize 1
	fRef.siba.SetDefaultTableAttr 1, 1, 0
	fRef.siba.LineSpacing = 120
End Sub
