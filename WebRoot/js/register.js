	function chinaCharactor(thisStr){
		var pattern=/[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/;
		if (!pattern.test(thisStr)){
			return false;
			}
		else {
			return true;
			}
		}

	function patternCheck(thisPattern){
		strTest = arguments[1];
		if (!thisPattern.test(strTest)){
			return false;
			}
		else {
			return true;
			}
		}		
var errMsg=[
            '登录名无效！',
            '密码必须多于或等于 6 个字符。',
            ];
var pattern=[
            /^[a-zA-Z0-9_]{3,}$/,
            /.{6,}/,
            ];
function showMsg(strName){
	strText = arguments[1];
	strName.parentNode.getElementsByTagName("span")[0].innerHTML='';
	strName.parentNode.getElementsByTagName("span")[0].innerHTML+=strText;
	}

function clearMsg(strId){
	strId.parentNode.getElementsByTagName("span")[0].innerHTML='';
	}

function regCheck(oThis){
	  nType=arguments[1];
	  if (nType==4) {
	  	strCon = !(document.getElementsByName('pass')[0].value==document.getElementsByName('rpass')[0].value);
	  	}
	  else {
	  	strCon = !patternCheck(pattern[nType],oThis.value);
	  	}
		if ( strCon ){
			showMsg(oThis,errMsg[nType]);
			return false;
			}
		else {
			clearMsg(oThis);
			return true;
			}	
		}		

function validateform(){
	var	oSpan   = document.getElementsByTagName("a");
	var bIsTrue = true;
	for (var i=0;i<oSpan.length;i++){
		//alert(oSpan[i]);]
	  if(bIsTrue==false){ 
	 	alert('输入有错，请重新检查');
	 	oSpan[i-1].parentNode.getElementsByTagName("a")[0].focus();
	  return false;	
	  }
	  oInput = oSpan[i].parentNode.getElementsByTagName("a");
		bIsTrue=regCheck(oInput[oInput.length-1],i)&&bIsTrue;
		}
	if (bIsTrue==true) {
	  return true;
	}
}		
