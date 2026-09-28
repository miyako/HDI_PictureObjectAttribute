Case of 
	: (Form event code:C388=On Load:K2:1)
		initHDI
		
		C_TEXT:C284(varFirstname)
		C_TEXT:C284(varLastname)
		C_PICTURE:C286(varAvatar)
		
		varFirstname:=""
		varLastname:=""
		
		ALL RECORDS:C47([Children:1])
		LISTBOX SELECT ROW:C912(*; "ListBox"; 1)
		selectRecord(1)
		
		OBJECT SET ENTERABLE:C238(*; "ListBox"; False:C215)
		
	: (Form event code:C388=On Page Change:K2:54)
		Var:=TextTabControl{TabControl}
		
End case 
