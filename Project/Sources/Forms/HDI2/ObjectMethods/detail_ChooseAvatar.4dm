var $path : Text

$path:=Select document:C905(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Avatar"+Folder separator:K24:12; ".jpg"; Localized string("HDI2_SelectImage"); Package open:K24:8)

If (OK=1)
	READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Avatar"+Folder separator:K24:12+$path; varAvatar)
	OB SET:C1220([Children:1]Obj:2; "avatar"; varAvatar)
End if 