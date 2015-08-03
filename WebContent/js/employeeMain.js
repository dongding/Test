$('#shclKeyframes')
		.shCircleLoader(
				{
					keyframes : "0%{background:black}40%{background:transparent}60%{background:transparent}100%{background:black}"
				});

function employeeMain($scope, $http) {
	// filter
	$scope.myfilter = {
		empIdFilter : "",
		empNameFilter : "",
		trainingProgramFilter : "",
		totalCostFilter : "",
		companyCoverFilter : "",
		servicePeriodFromFilter : "",
		servicePeriodToFilter : "",
		statusFilter : ""
	};

	// get all applications
	$scope.applications;
	$.ajax( {
		type : "POST",
		async : false,
		url : "getallapplicationayJson",
		beforeSend : function() {
			$('#shclKeyframes').show();
		},
		success : function(data) {
			$scope.applications = eval(data);
			setTimeout(function() {
				$('#shclKeyframes').hide();
			}, 1000);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
	
	
	$scope.traffics;
	$.ajax( {
		type : "POST",
		async : false,
		url : "getalltrafficJson",
		beforeSend : function() {
			$('#shclKeyframes').show();
		},
		success : function(data) {
			$scope.traffics = eval(data);
			setTimeout(function() {
				$('#shclKeyframes').hide();
			}, 1000);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});

	$scope.refresh = function(){
		$scope.moveTheDiv();
		$scope.initBeforeRef();
		$('#shclKeyframes').show();
		$('#tbodyemployee').css('display','none');
		$.ajax( {
			type : "POST",
			async : false,
			url : "getallapplicationayJson",
			beforeSend : function() {
				$('#shclKeyframes').show();
			},
			success : function(data) {
				$scope.applications = eval(data);
				
				setTimeout(function() {
					$('#tbodyemployee').css('display','block');
					for(var i=0;i<$('#theademployee').children().children().size();i++){
						for(var j=0;j<$('#tbodyemployee').children().children().children().size();j++){
						if($('#tbodyemployee').children().children().children().eq(j).attr('id')=='employeedetail'){
							continue;
						}
							$('#tbodyemployee').children().children().children().eq(j).children().eq(i).width($('#theademployee').children().children('th').eq(i).outerWidth());;		
						}
					}
					$('#shclKeyframes').hide();
					
				}, 1000);
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
		
	}
	
	$scope.refresh1 = function(){
		$scope.moveTheDiv();
		$scope.initBeforeRef();
		$('#shclKeyframes').show();
		$('#tbodyemployee').css('display','none');
		$.ajax( {
			type : "POST",
			async : false,
			url : "getalltrafficJson",
			beforeSend : function() {
				$('#shclKeyframes').show();
			},
			success : function(data) {
				$scope.traffics = eval(data);
				
				setTimeout(function() {
					$('#tbodyemployee').css('display','block');
					for(var i=0;i<$('#theademployee').children().children().size();i++){
						for(var j=0;j<$('#tbodyemployee').children().children().children().size();j++){
						if($('#tbodyemployee').children().children().children().eq(j).attr('id')=='employeedetail'){
							continue;
						}
							$('#tbodyemployee').children().children().children().eq(j).children().eq(i).width($('#theademployee').children().children('th').eq(i).outerWidth());;		
						}
					}
					$('#shclKeyframes').hide();
					
				}, 1000);
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
		
	}
	// show detail
	$scope.now = null;
	$scope.selapplication;
	

	// check agreement

	$scope.begindelete = function(dataId, status) {
		if (status == "unsubmit") {
			$('#deleteWarn').slideToggle();
			$('#deldataid').val(dataId);
		}
	};

	// employee edit

	$scope.chineseName = "";
	$scope.identification = "";
	$scope.trainingInstitution = "";
	$scope.reason = "";
	$scope.period = {
		time : "",
		value : null
	};
	$scope.periodtype = [ {
		time : "12 months",
		value : 12
	}, {
		time : "6 months",
		value : 6
	} ];

	$scope.newapplications;
	$scope.status = "";
	$scope.statustype = [ {
		sta : "approved"
	}, {
		sta : "submitted"
	} ];
	$scope.reason = "";
	$scope.time1 = "";
	$scope.time2 = "";
	$scope.time3 = "";
	$scope.time4 = "";
	$scope.money1 = "";
	$scope.money2 = "";
	$scope.cc = "";
	$scope.approver = "";
	$scope.program = "";
	$scope.showmsg1 = "none";
	$scope.showmsg2 = "none";
	$scope.showmsg3 = "none";
	$scope.msg1 = "";
	$scope.msg2 = "";
	$scope.msg3 = "";
	$scope.type = "";
	$scope.now = null;
	$scope.applications;
	$scope.selapplication;
	$scope.newapplications;
	$scope.allappro;
	$scope.allpro;
	$scope.allcc;
	$scope.dataid;
	$scope.reason;
	$scope.historyNotes;

	$scope.select = function() {
		if ($scope.newapplications.chineseName != null) {
			$scope.chineseName = $scope.newapplications.chineseName;
		}
		if ($scope.newapplications.identification != null) {
			$scope.identification = $scope.newapplications.identification;
		}
		if ($scope.newapplications.trainingInstitution != null) {
			$scope.trainingInstitution = $scope.newapplications.trainingInstitution;
		}
		if ($scope.newapplications.trainingProgram != null) {
			$scope.program = $scope.newapplications.trainingProgram;
		}
		if ($scope.newapplications.cc != null) {
			$scope.cc = $scope.newapplications.cc;
		}
		if ($scope.newapplications.approver != null) {
			$scope.approver = $scope.newapplications.approver;
		}
		if ($scope.newapplications. != null) {
			$scope.money1 = $scope.newapplications.;
		}
		if ($scope.newapplications.companyCover != null) {
			$scope.money2 = $scope.newapplications.companyCover;
		}
		if ($scope.newapplications.trainingPeriodFrom != null) {
			$scope.time1 = $scope.newapplications.trainingPeriodFrom;
		}
		if ($scope.newapplications.trainingPeriodTo != null) {
			$scope.time2 = $scope.newapplications.trainingPeriodTo;
		}
		if ($scope.newapplications.setPeriod != null) {
			$scope.period.time = $scope.newapplications.setPeriod;
			if ($scope.period.time == "6 months") {
				$scope.period.value = 6;
			} else if ($scope.period.time == "12 months") {
				$scope.period.value = 12;
			}
		}
		if ($scope.newapplications.status != null) {
			if ($scope.newapplications.status == "unsubmit") {
				$scope.status = "";
			} else {
				$scope.status = $scope.newapplications.status;
			}
		}
		if ($scope.newapplications.reason != null) {
			$scope.reason = $scope.newapplications.reason;
		}
	};

	$scope.showdetail = function(ve) {
		$scope.historyNote = "";
		if ($scope.now == null) {
			$scope.showdetailtobox(ve);
			$(document.getElementById(ve)).after($("#employeedetail"));
			$(document.getElementById(ve)).css("background-color", "#E1E7EC");
			$("#employeedetail").show(500);
			$scope.now = ve;
			setTimeout($scope.movetosuitable($scope.now,600));
		} else if ($scope.now == ve) {
			$("#employeedetail").hide(500);
			$("#dd").css('display','none');
			$(document.getElementById(ve)).css("background-color", "");
			$scope.now = null;
		} else if ($scope.now != ve) {
			$("#employeedetail").css("display", "none");
			$("#employeedetail").hide(500);
			$("#dd").css('display','none');
			$(document.getElementById($scope.now)).css("background-color", "");
			$scope.showdetailtobox(ve);
			$(document.getElementById(ve)).after($("#employeedetail"));
			$(document.getElementById(ve)).css("background-color", "#E1E7EC");
			$("#employeedetail").show(500);
			$scope.now = ve;
			setTimeout($scope.movetosuitable($scope.now,600));
		}
	};
	
	$scope.movetosuitable = function(ve){
		var allheight = $('#tbodyemployee').offset().top + $('#tbodyemployee').height();
		var lineheight = $(document.getElementById(ve)).offset().top + $(document.getElementById(ve+",")).height();	
		var detailheight = 360;
		if(detailheight + lineheight> allheight){
			var move = detailheight + lineheight - allheight;
			$('#tbodyemployee').animate({scrollTop:'+=' + move + 'px'},500);
		}
	};
	
	
	$scope.focusme = function (ve){
		$('#tbodyemployee').find('tr').not(document.getElementById($scope.now)).css('background','');
		$(document.getElementById(ve)).css('background','#E1E7EC');
	};
	
	$scope.showdetailtobox = function(ve) {
		for ( var i = 0; i < $scope.applications.length; i++) {
			if ($scope.applications[i].dataId == ve) {
				$scope.selapplication = $scope.applications[i];

				return;
			}
		}

	};

	$scope.beginedit = function(status) {
		$(".bar").text("Edit");
//		document.getElementById("bar2").innerHTML="Application Edit";
//		document.getElementById("bar").innerHTML="Application Edit";
		if (status != "unsubmit" && status != "disapproved")
			return;
		$scope.newapplications = $scope.selapplication;
		$scope.select();
		$("#empeditpage").css("display", "block");
		$('#selecttab').children().removeClass('active');
		$("#empeditpage").addClass('active');

		$('.agreementview').css("display", "none");
		$('#employeeeditform').css("display", "block");
	};

	$scope.setCc = function(va) {
		if (isExit(va)) {
			return;
		} else {
			$scope.cc = $scope.cc + ";" + va;
		}
		;
	};
	$scope.setApprover = function(va) {
		$scope.approver = va;
	};

	$scope.setProgram = function(va) {
		$scope.program = va;
	};
	$scope.setPeriod = function(va, ve) {
		$scope.period.time = va;
		$scope.period.value = ve;
	};
	$scope.setStatus = function(ve) {
		$scope.status = ve;
	};
	$scope.left = function() {
		return 500 - $scope.reason.length;
	};
	$scope.getthedate = function() {

		if ($scope.time2 != "") {

			var a = new Date($scope.time2);
			a = a.valueOf();
			a = a + 1 * 24 * 60 * 60 * 1000;
			a = new Date(a);
			var m = a.getMonth() + 1;
			if (m.toString().length == 1) {
				m = '0' + m;
			}
			var d = a.getDate();
			if (d.toString().length == 1) {
				d = '0' + d;
			}
			$scope.time3 = a.getFullYear() + "-" + m + "-" + d;
			return $scope.time3;
		}
	};

	$scope.gettheMonth = function() {
		if ($scope.time3 != ''
				&& ($scope.period.value == 12 || $scope.period.value == 6)) {

			var ti = $scope.time2.split("-");
			var year = parseInt(ti[0]);
			var month = parseInt(ti[1]);
			var day = parseInt(ti[2]);
			if (parseInt($scope.period.value) == 12) {
				year = year + 1;
			}
			if (parseInt($scope.period.value) == 6) {
				if (month > 6) {
					year = year + 1;
					month = month + 6 - 12;
				} else {
					month = month + 6;
				}
			}
			if (month == 2 && day == 29) {
				day--;
			}
			if (month < 10) {
				month = "0" + month;
			}
			if (day < 10) {
				day = "0" + day;
			}
			$scope.time4 = year + "-" + month + "-" + day;
			return $scope.time4;
		}
	};
	
	//check
	$scope.isEmpty=false;
	$scope.checkMoney=function(){
		var m2 = $scope.money2;
    	var m1 = $scope.money1;
    	m2 = m2.replace(/[,]/g,""); 
    	m1 = m1.replace(/[,]/g,""); 
    	if(parseFloat(m2)>=100000){
			$('#companyCover').css("border-color","red");
			return "Company cover should be smaller than 100,000.00."
    	}
    	else{
    		if(parseFloat(m2) > parseFloat(m1)){
    			$('#totalCost').css("border-color","red");
    			$('#companyCover').css("border-color","red");
    			return "Company cover should be smaller than Total cost.";
    		}
    		else{
    			$('#totalCost').css("border-color","");
    			$('#companyCover').css("border-color","");
    			return "";
    		}
    	}
    };
    $scope.checkTime = function(){
		var dtArr1 = $scope.time1.split("-");
		var dtArr2 = $scope.time2.split("-");
		var dt1 = new Date(dtArr1[0], dtArr1[1], dtArr1[2]);
		var dt2 = new Date(dtArr2[0], dtArr2[1], dtArr2[2]);
		if(dt1>dt2){
			$('#datetimepicker3').css("border-color","red");
			$('#datetimepicker4').css("border-color","red");
			return "End training period should be later than begin training period."
		}
		else{
			$('#datetimepicker3').css("border-color","");
			$('#datetimepicker4').css("border-color","");
			return "";
		}
    };
    $scope.checkAll=function(){
    	$scope.isEmpty=false;
    	if($scope.program==""){
    		$scope.isEmpty=true;
    		$('#trainingProgram').css("border-color","red");
    	}
    	else
    		$('#trainingProgram').css("border-color","");
    	if($scope.money1==""){
    		$scope.isEmpty=true;
    		$('#totalCost').css("border-color","red");
    	}
    	else if($scope.checkMoney()==""||$scope.checkMoney()=="Company cover should be smaller than 100,000.00.")
    		$('#totalCost').css("border-color","");
    	if($scope.money2==""){
    		$scope.isEmpty=true;
    		$('#companyCover').css("border-color","red");
    	}
    	else if($scope.checkMoney()=="")
    		$('#companyCover').css("border-color","");
    	if($scope.time1==""){
    		$scope.isEmpty=true;
    		$('#datetimepicker3').css("border-color","red");
    	}
    	else if($scope.checkTime()=="")
    		$('#datetimepicker3').css("border-color","");
    	if($scope.time2==""){
    		$scope.isEmpty=true;
    		$('#datetimepicker4').css("border-color","red");
    	}
    	else if($scope.checkTime()=="")
    		$('#datetimepicker4').css("border-color","");
    	if($scope.period.time==""){
    		$scope.isEmpty=true;
    		$('#setPeriod').css("border-color","red");
    	}
    	else
    		$('#setPeriod').css("border-color","");
    	if($scope.isEmpty)
    		return "The fields with ' * ' cannot be blank.";
    	else
    		return "";
    };
    $scope.showMsg="";
    $scope.checkDisplay=function(){
    	$scope.showMsg="";
    	var display="none",msg;
    	msg=$scope.checkIsChinese();
    	if(msg!=""){
    		 display="block";
    		 if($scope.showMsg=="")
    			 $scope.showMsg=msg;
    	}
    	msg=$scope.checkIdentification();
    	if(msg!=""){
    		 display="block";
    		 if($scope.showMsg=="")
    			 $scope.showMsg=msg;
    	}
    	msg=$scope.checkMoney();
    	if(msg!=""){
    		display="block";
   		 	if($scope.showMsg=="")
   		 		$scope.showMsg=msg;
    	}
    	msg=$scope.checkTime();
    	if(msg!=""){
    		display="block";
   		 	if($scope.showMsg=="")
   		 		$scope.showMsg=msg;
    	}
    	if($scope.isEmpty){
    		msg=$scope.checkAll();
    		if(msg!=""){
        		display="block";
       		 	if($scope.showMsg=="")
       		 		$scope.showMsg=msg;
        	}
    	}
    	return display;
    }
    $scope.change=function(){
    	$('#trainingProgram').css("border-color","");
    	$scope.isok=false;
    }
    
	$scope.saveAsEmployee = function(){
    	$('#saveEmp').attr("action","saveapplicationbyemployee");
    	$('#saveEmp').submit();
    };
    
    //submit
    $scope.submitAsEmployee = function(){

		var ok=true;
		if($scope.checkMoney()!="")
			ok=false;
		if($scope.checkTime()!="")
			ok=false;
		if($scope.checkAll()!="")
			ok=false;
		if(!ok)
			return;
		$.ajax({
	        type:"POST",
	        async:false,
	        url:"checkprogramrepeat?program="+$scope.program,
	        success:function(data){ 
				if(data=='Y'){
					$('#trainingProgram').css("border-color","red");
					$scope.isok=true;
					return;
				}else if(data=='N'){
					$('#saveEmp').attr("action","addapplicationbyemployee");
			    	$('#saveEmp').submit();
				}
					

			},
	        error:function(XMLHttpRequest,textStatus,errorThrown){
			}
	    });
    };
    
    $http.post("getallprogrambyJson")
    .success(function(data) {
    	$scope.all = data;
    })
    .error(function(){
    });
    
    $http.post("getallapproverbyJson")
    .success(function(data1) {
    	$scope.allappro = data1;
    }
    ).error(function(){
    });
    
    $http.post("getalladminbyJson")
    .success(function(data) {
    	$scope.allcc = data;
    }
    ).error(function(){
    });
    
    //set 
    $scope.setApprover=function(v){
    	$scope.approver=v;
    }
    $scope.setCc=function(v){
    	if(isExit(v))
    		return;
    	$scope.cc=$scope.cc+v+";";
    }
    $scope.setProgram=function(v){
    	$scope.program=v;
    }
    $scope.setPeriod=function(va,ve){
    	$scope.period.time=va;
    	$scope.period.value=ve;
    }
    $scope.moveTheDiv = function(){
   	 $("#employeedetail").hide(500);
		 $("#employeedetail").css("display","none");
		 $(document.getElementById('count2')).after($("#employeedetail"));
   }
    
    $scope.initBeforeRef = function(){
    	$(':checkbox')[0].checked = false;
    	$scope.myfilter.trainingProgramFilter = "";
    	$scope.myfilter.totalCostFilter = "";
    	$scope.myfilter.companyCoverFilter = "";
    	$scope.myfilter.servicePeriodFromFilter = "";
    	$scope.myfilter.servicePeriodToFilter = "";
    	$scope.myfilter.statusFilter = "";
    }
}
