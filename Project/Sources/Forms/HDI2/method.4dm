Case of 
	: (Form event code:C388=On Load:K2:1)
		initHDI
		
		var varFirstname : Text
		var varLastname : Text
		var varAvatar : Picture
		
		varFirstname:=""
		varLastname:=""
		
		ALL RECORDS:C47([Children:1])
		LISTBOX SELECT ROW:C912(*; "ListBox"; 1)
		selectRecord(1)
		
		OBJECT SET ENTERABLE:C238(*; "ListBox"; False:C215)
		
	: (Form event code:C388=On Page Change:K2:54)
		Var:=TextTabControl{TabControl}
		
End case 
