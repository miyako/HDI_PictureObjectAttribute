If (Is new record:C668([Children:1]))
	bNew:=True:C214
Else 
	bNew:=False:C215
End if 

// retrieve the information in form object and set the information in the field object
OB SET:C1220([Children:1]Obj:2; "firstname"; varFirstname)
OB SET:C1220([Children:1]Obj:2; "lastname"; varLastname)
OB SET:C1220([Children:1]Obj:2; "avatar"; varAvatar)

// save in database
SAVE RECORD:C53([Children:1])



//refresh the listbox
If (bNew)
	ALL RECORDS:C47([Children:1])
Else 
	REDRAW:C174(Get pointer:C304("ListBox")->)
End if 