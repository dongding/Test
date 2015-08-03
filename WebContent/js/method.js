var app=angular.module("MyApp",[]);
app.filter('MyFilter',function(){
    return function(inputArray,e){
    	var array=[];
    	for(var i=0;i<inputArray.length;i++){
    		if(inputArray[i].empId.toLowerCase().search(e.empIdFilter.toLowerCase())<0)
    			continue;
    		if(inputArray[i].empName.toLowerCase().search(e.empNameFilter.toLowerCase())<0)
    			continue;
    		if(inputArray[i].trainingProgram.toLowerCase().search(e.trainingProgramFilter.toLowerCase())<0)
    			continue;
    		if(inputArray[i].totalCost.replace(/[,]/g,"").search(e.totalCostFilter.replace(/[,]/g,""))<0)
    			continue;
    		if(inputArray[i].companyCover.replace(/[,]/g,"").search(e.companyCoverFilter.replace(/[,]/g,""))<0)
    			continue;
    		if(inputArray[i].servicePeriodFrom.replace(/[-]/g,"").search(e.servicePeriodFromFilter.replace(/[-]/g,""))<0)
    			continue;
    		if(inputArray[i].servicePeriodTo.replace(/[-]/g,"").search(e.servicePeriodToFilter.replace(/[-]/g,""))<0)
    			continue;
    		if(inputArray[i].status.toLowerCase().search(e.statusFilter.toLowerCase())!= 0)
    			continue;
    		array.push(inputArray[i]);
    	}
    	return array;
    }
});
app.filter('MyOrderBy',function($filter){
    return function(inputArray,f,rev1){
    	for(var i=0;i<inputArray.length;i++){
    		if(inputArray[i].totalCost!=""){
    			inputArray[i].totalCost=inputArray[i].totalCost.replace(/[,]/g,"");
    			inputArray[i].totalCost=parseFloat(inputArray[i].totalCost);
    		}
    		if(inputArray[i].companyCover!=""){
    			inputArray[i].companyCover=inputArray[i].companyCover.replace(/[,]/g,"");
    			inputArray[i].companyCover=parseFloat(inputArray[i].companyCover);
    		}
    	}
    	var array=[];
		array=$filter('orderBy')(inputArray,f,rev1);
		var newArray=[];
		for(var i=array.length-1;i>=0;i--){
			array[i].totalCost=array[i].totalCost.toLocaleString();
			array[i].companyCover=array[i].companyCover.toLocaleString();
			if(array[i].totalCost!=""&&array[i].totalCost.search("\\.")<0){
				array[i].totalCost=array[i].totalCost+(".00");
			}
			else if(array[i].totalCost!=""&&array[i].totalCost.search("\\.")==array[i].totalCost.length-2){
				array[i].totalCost=array[i].totalCost+("0");
			}
			if(array[i].companyCover&&array[i].companyCover.search("\\.")<0){
				array[i].companyCover=array[i].companyCover+(".00");
			}
			else if(array[i].companyCover!=""&&array[i].companyCover.search("\\.")==array[i].companyCover.length-2){
				array[i].companyCover=array[i].companyCover+("0");
			}
			newArray.push(array[i]);
    	}
    	return newArray;
    }
});

var arr = new Array();
function IsFloat(obj) {
	obj.value = obj.value.replace(/[^\d.]/g, "");
	obj.value = obj.value.replace(/^\./g, "");
	 obj.value = obj.value.replace(/^0/g, "0.");
	obj.value = obj.value.replace(/\.{2,}/g, ".");
	obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$",
			".");
	var strs = "";
	var midd = "";
	var count = 0;
	for ( var i = 0; i < obj.value.length; i++) {
		if (obj.value.charAt(i) == ".") {
			midd = "start";
		}
		if (midd == "start") {
			count++;
		}
		if (count == 4) {
			break;
		}
		strs += obj.value.charAt(i);
	}
	obj.value = strs;
}



function AngelMoney(st) {
	if (st == "") {
		return "";
	}
	var s = st;
	if(st.charAt(0)=='0'&&st.charAt(1)!='.'){
		   return "";
	   }
	s = s.replace(/^(\d*)$/, "$1.");
	s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
	s = s.replace(".", ",");
	var re = /(\d)(\d{3},)/;
	while (re.test(s))
		s = s.replace(re, "$1,$2");
	s = s.replace(/,(\d\d)$/, ".$1");
	return s.replace(/^\./, "0.");
}



$('#datetimepicker1').datetimepicker({
	
	format:'Y-m-d',
	formatDate:'Y-m-d',
	timepicker:false,
	onSelectDate: function(){
		$('#datetimepicker1').trigger("change");
	}
});

$('#datetimepicker2').datetimepicker({
format:'Y-m-d',
formatDate:'Y-m-d',
timepicker:false,
onSelectDate: function(){
	$('#datetimepicker2').trigger("change");
}
});

$('#datetimepicker3').datetimepicker({
format:'Y-m-d',
formatDate:'Y-m-d',
timepicker:false,
onSelectDate: function(){
	$('#datetimepicker3').trigger("change");
}
});

$('#datetimepicker4').datetimepicker({
format:'Y-m-d',
formatDate:'Y-m-d',
timepicker:false,
onSelectDate: function(){
	$('#datetimepicker4').trigger("change");
}
});

var getCursortPosition = function(ctrl) {
	var CaretPos = 0;
	// IE Support
	if (document.selection) {
	ctrl.focus();
	var Sel = document.selection.createRange();
	Sel.moveStart ('character', -ctrl.value.length);
	CaretPos = Sel.text.length;
	}
	// Firefox support
	else if (ctrl.selectionStart || +ctrl.selectionStart === 0)
	{CaretPos = ctrl.selectionStart;}
	return (CaretPos);
	};
	 
	var selectSomeText = function(element,begin,end)
	{
	if (element.setSelectionRange)
	{
	element.setSelectionRange(begin,end);
	}
	else if (element.createTextRange)
	{
	var range = element.createTextRange();
	range.moveStart("character",begin+1);
	range.moveEnd("character",end);
	range.select();
	}
	};
	 
	var delWholeWord = function(text, field, pos){
	var startIndex = pos;
	while(field.charAt(pos-1)!==';'){
		if(field.length==pos) break;
		pos++;
	}
	if (field.charAt(pos-1) !== ' '){
	for (var i=pos-2;i>=0;i--){
	if (field.charAt(i) === ' ' || i === 0||field.charAt(i)==';'){
	startIndex = i;
	break;
	}
	}
	if(field.charAt(startIndex)==';')
		selectSomeText(text, startIndex+1, pos);
	else
		selectSomeText(text, startIndex, pos);
	}
	 
	};
	$('#cc').keydown(function(event) {
		if(event.keyCode !== 8) {
//			 event.preventDefault();
			return;
		}
		var bodyText = $(this)[0];
		var bodyField = $(this).val();
		var pos = getCursortPosition(bodyText);
		delWholeWord(bodyText, bodyField, pos);
		});

		function isExit(empName){
			var temp = $('#cc').val().split(';');
			var len = temp.length;
			for(i=0;i<len;i++){
				if(temp[i]==empName)
					return true;
			}
			return false;
		}
	// show/hide the history reject notes
		function history(obj, sType) { 
			var oDiv = document.getElementById(obj); 
			if (sType == 'show') { oDiv.style.display = 'block';} 
			if (sType == 'hide') { oDiv.style.display = 'none';} 

			}   
		function history1(obj, sType) { 
// $('#tbody').html("<tr><td</td><td>There is no such record</td></tr>");
			var dataId = $('#dataIdtemp').val();
			$.ajax({
		        type: "POST",
		        url: "gethistorynotesbydataid?dataid="+dataId,
		        success: function(data){ 
					if(data=="")
						$('#tbody').html("<tr><td colspan=2>There is no such record</td></tr>");
					else
					 $('#tbody').html(data);
				},
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		     }
		    });
			history(obj,sType);
			
			}  
		
		function history2(obj, sType) { 
// $('#tbody').html("<tr><td</td><td>There is no such record</td></tr>");
			var dataId = $('#dataIdtemp2').val();
			$.ajax({
		        type: "POST",
		        url: "gethistorynotesbydataid?dataid="+dataId,
		        success: function(data){ 
					if(data=="")
						$('#tbody2').html("<tr><td colspan=2>There is no such record</td></tr>");
					else
					 $('#tbody2').html(data);
				},
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		     }
		    });
			history(obj,sType);
			
			}

		function history3(obj, sType) { 
// $('#tbody').html("<tr><td</td><td>There is no such record</td></tr>");
			var dataId = $('#dataIdtemp3').val();
			$.ajax({
		        type: "POST",
		        url: "getcommentsbydataid?dataid="+dataId,
		        success: function(data){ 
					if(data=="")
						$('#tbody3').html("<tr><td colspan=2>There is no such record</td></tr>");
					else
					 $('#tbody3').html(data);
				},
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		     }
		    });
			history(obj,sType);
			
			}

		function history4(obj, sType) { 
// $('#tbody').html("<tr><td</td><td>There is no such record</td></tr>");
			var dataId = $('#dataIdtemp4').val();
			$.ajax({
		        type: "POST",
		        url: "getcommentsbydataid?dataid="+dataId,
		        success: function(data){ 
					if(data=="")
						$('#tbody4').html("<tr><td colspan=2>There is no such record</td></tr>");
					else
					 $('#tbody4').html(data);
				},
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		     }
		    });
			history(obj,sType);
			
			}
		
		
		 
    	
function showList(){
	$('#employeeListForm').css("display","block");
	$('#editform').css("display","none");
	$('#showemployee').addClass("active");
	$('#editpage').removeClass("active");
}
function showEditForm(){
	$('#editform').css("display","block");
	$('#employeeListForm').css("display","none");
	$('#editpage').addClass("active");
	$('#showemployee').removeClass("active");
}


function showAdmin(){
	$('#employeeform').css("display","none");
	$('#showemployee').removeClass('active');
	$('#adminform').css("display","block");
	$('#showadmin').addClass('active');	
}

function showEmployee(){
	
	$('#adminform').css("display","none");
	$('#showadmin').removeClass('active');
	$('#employeeform').css("display","block");
	$('#showemployee').addClass('active');	
}


var idTmr;
function  getExplorer() {
	var explorer = window.navigator.userAgent ;
	// ie
	if (explorer.indexOf("MSIE") >= 0) {
		return 'ie';
	}
	
	
	if ((navigator.userAgent.indexOf('MSIE') >= 0) 
		    && (navigator.userAgent.indexOf('Opera') < 0)){
		    return 'ie';
	}
	// firefox
	else if (explorer.indexOf("Firefox") >= 0) {
		return 'Firefox';
	}
	// Chrome
	else if(explorer.indexOf("Chrome") >= 0){
		return 'Chrome';
	}
	// Opera
	else if(explorer.indexOf("Opera") >= 0){
		return 'Opera';
	}
	// Safari
	else if(explorer.indexOf("Safari") >= 0){
		return 'Safari';
	}
}
function method1(tableid) {//
	
	var explorer = window.navigator.userAgent ;
	var a=getExplorer();
	if(!(a=='ie'|a=='Firefox'|a=='Chrome'|a=='Opera'|a=='Safari'))
	{
		  var curTbl = document.getElementById(tableid);

            var oXL = new ActiveXObject("Excel.Application"); 

            var oWB = oXL.Workbooks.Add(); 

            var oSheet = oWB.ActiveSheet; 

            var Lenr = curTbl.rows.length; 

            for (i = 0; i < Lenr; i++) {

                var Lenc = curTbl.rows(i).cells.length; 

                for (j = 0; j < Lenc; j++) {

                    oSheet.Cells(i+1, j+1).value = curTbl.rows(i).cells(j).innerText; 

                }

            }

            oXL.Visible = true; 

		try {
			var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
		} catch (e) {
			print("Nested catch caught " + e);
		} finally {
			oWB.SaveAs(fname);

			oWB.Close(savechanges = false);
			// xls.visible = false;
			oXL.Quit();
			oXL = null;
			idTmr = window.setInterval("Cleanup();", 1);

		}
		
	}
	else
	{
		tableToExcel(tableid)
	}
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {
	  var uri = 'data:application/vnd.ms-excel;base64,',
	  fileName = 'Training Tracking',
	  template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="Content-Type" content="text/html; charset=utf-8"> </head><body><table>{table}</table></body></html>',
		base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
		format = function(s, c) {
			return s.replace(/{(\w+)}/g,
			function(m, p) { return c[p]; }) }
		return function(table, name) {
		if (!table.nodeType) table = document.getElementById(table)
		var ctx = {worksheet: name || 'Trainning Tracking', table: table.innerHTML}
		var a = document.createElement('a');
        document.body.appendChild(a);
       // a.charset = "gbk2312";
        a.type="application/vnd.ms-excel;charset=gb2312";
        a.target = '_top';
        a.download = fileName + '.xls';
        a.href=uri + base64(format(template, ctx));
        a.click(); 
	  }
	})();