$('#shclKeyframes').shCircleLoader({keyframes:"0%{background:black}40%{background:transparent}60%{background:transparent}100%{background:black}"});

function approverMain($scope,$http){
	$scope.myfilter={empIdFilter:"",empNameFilter:"",trainingProgramFilter:"",totalCostFilter:"",companyCoverFilter:"",servicePeriodFromFilter:"",servicePeriodToFilter:"",statusFilter:""};
	$scope.period = {time:"",value:null};
	$scope.periodtype = [{time:"12 months",value:12},{time:"6 months",value:6}];
	$scope.status = "";
	$scope.statustype = [{sta:"approved"},{sta:"submitted"},{sta:"disapprove"}];
    $scope.reason = "";
    $scope.time1 = "";
    $scope.time2 = "";
    $scope.time3 = "";
    $scope.time4 = "";
    $scope.money1 = "";
    $scope.money3 = 0;
    $scope.money2 = "";
    $scope.cc = "";
	$scope.approver = "";
	$scope.program = "";
	$scope.showmsg = "none";
	$scope.showmsg1 = "none";
	$scope.showmsg2 = "none";
	$scope.showmsg3 = "none";
	$scope.msg = "";
	$scope.msg1 = "";
	$scope.msg2 = "";
	$scope.msg3 = "";
	$scope.type = "";
	$scope.now = null;
	$scope.applications;
	$scope.selapplication;
	$scope.newapplications ;
	$scope.allappro;
	$scope.allpro;
	$scope.allcc;
	$scope.dataid="";
	$scope.reason;
	$scope.empId;
	$scope.empName;
	$scope.program1;
	$scope.rejectNotes="";
	$scope.comments="";
	$scope.myVar=false;
	$scope.select = function(){
		if ($scope.newapplications.chineseName != null) {
			$scope.chineseName = $scope.newapplications.chineseName;
		}
		if ($scope.newapplications.identification != null) {
			$scope.identification = $scope.newapplications.identification;
		}
		if ($scope.newapplications.trainingInstitution != null) {
			$scope.trainingInstitution = $scope.newapplications.trainingInstitution;
		}
		if($scope.newapplications.trainingProgram != null){
			$scope.program = $scope.newapplications.trainingProgram;
		}
		if($scope.newapplications.cc != null){
			$scope.cc = $scope.newapplications.cc;
		}
		if($scope.newapplications.approver != null){
			$scope.approver = $scope.newapplications.approver;
		}
		if($scope.newapplications.totalCost != null){
			$scope.money1 = $scope.newapplications.totalCost;
		}
		if($scope.newapplications.companyCover != null){
			$scope.money2 = $scope.newapplications.companyCover;
		}
		if($scope.newapplications.trainingPeriodFrom != null){
			$scope.time1 = $scope.newapplications.trainingPeriodFrom;
		}
		if($scope.newapplications.trainingPeriodTo != null){
			$scope.time2 = $scope.newapplications.trainingPeriodTo;
		}
		if($scope.newapplications.setPeriod != null){
			$scope.period.time = $scope.newapplications.setPeriod;
			if($scope.period.time == "6 months"){
				$scope.period.value = 6;
			}else if($scope.period.time == "12 months"){
				$scope.period.value = 12;
			}
		}
		if($scope.newapplications.status != null){
			if($scope.newapplications.status == "unsubmit"){
				$scope.status = "";
			}else{
				$scope.status = $scope.newapplications.status;
			}
		}
		if($scope.newapplications.empId != null){
			$scope.empId = $scope.newapplications.empId;
		}
		if($scope.newapplications.empName != null){
			$scope.empName = $scope.newapplications.empName;
			$scope.applicant = $scope.newapplications.empName;
		}
		if($scope.newapplications.reason != null){
			$scope.reason = $scope.newapplications.reason;
		}
	};
	
	$scope.setRejectNotes = function(va){
		$scope.rejectNotes = va;
    };
    $scope.setComments = function(va){
		$scope.comments = va;
    };
	$scope.setCc = function(va){
    	$scope.cc = va;
    };
    $scope.setApprover = function(va){
    	$scope.approver = va;
    };
    
    $scope.setProgram = function(va){
    	$scope.program = va;
    };
    $scope.setapplicant = function(va){
    	$scope.applicant = va;
    	$scope.getId();
    };
    
    $scope.setempId = function(va){
    	$scope.empId = va;
    	$scope.getName();
    }; 
    $scope.approurl="";
    $scope.disapprourl="";
    $scope.approveByApprover = function(dataId,status){
		var str = '';
		var url = '';
		$('input:checked').each(function(){
			if($(this)[0].id=="allChecked")
            	return;
        	str+=$(this)[0].id;
		});
		if(status=="approved"||status=="disapproved")
			return;
		if(str.indexOf(dataId)==-1){
			url = "approvedbyapprover?dataid="+dataId;
			$.ajax({
		        type: "POST",
		        async:false,
		        url: url,
		        success: function(data){
		        	for(var i=0;i<$scope.applications.length;i++){
		        		if($scope.applications[i].dataId == dataId){
		        			$scope.selapplication = $scope.applications[i];
		        			break;
		        		}
		        	}
		        	$scope.selapplication.status = 'approved';
		    		setTimeout(function(){
		    			$('#tr'+dataId).css("background-color","#E1E7EC");
		    		}, 500);
		        	
		    		
		        },
		        error:function(XMLHttpRequest, textStatus, errorThrown){
		     }
		    });
		}else{
			$scope.approurl = "approvedbyapprover?dataid="+str;
			$('#approverWarn').slideToggle("slow");
		}
		
	};
    
	$scope.disapproveByApprover = function(dataId){  
    	var url = '';
    	url =  "disapprovedbyapprover?dataid="+dataId+"&rejectNotes="+$scope.rejectNotes;
    	$.ajax({
	        type: "POST",
	        async:false,
	        url: url,
	        success: function(data){
	        	$scope.selapplication.status = 'disapproved';
	        	$scope.selapplication.rejectNotes = $scope.rejectNotes;
	        	$scope.selapplication.rejected = '1';
	        	$scope.moveTheDiv('rejectNotes');  
	    		$(document.getElementById('tr'+dataId)).css("background-color","#E1E7EC");
	    		 },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
  
    }
    $scope.donotapprover = function(ve){
    	$('#approverWarn').slideToggle("slow");
    };
    
    $scope.doapprover = function(){
    	$.ajax({
	        type: "POST",
	        async:false,
	        url: $scope.approurl,
	        beforeSend: function () { 
			$('#shclKeyframes').show();
			 },
	        success: function(data){
				 $('#approverWarn').slideToggle("slow");
	        	$scope.refresh();
	        	setTimeout(function(){
	        		var ids = str.split(',');
		        	for(t=0;t<ids.length-1;t++){
		        		 $('#tr'+ids[t]).css('background','#E1E7EC');
		        	}
	        	}, 500);
	        	
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
    };
    
  $scope.commentsByApprover = function(dataId){
    	if($scope.comments=="")
    		return;
    	var url = '';
    	url =  "approveraddcomments?dataid="+dataId+"&comments="+$scope.comments;
    	$.ajax({
	        type: "POST",
	        async:false,
	        url: url,
	        success: function(data){
	        	$scope.selapplication.commented = '1';
	        	$scope.selapplication.comments = $scope.comments;
	        	$scope.moveTheComment();
	        	
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
    };
    
    
    
    $scope.showRejectNotes = function(ve,status){
    	$scope.rejectNotes="";
    	var str = '';
		$('input:checked').each(function(){
			if($(this)[0].id=="allChecked")
            	return;
        	str+=$(this)[0].id;
		});
		if(str==''){
	    	$('#rejectNotes1').css("border-color","");
			if(status=="approved"||status=="disapproved")
				return;
			if($scope.now == null){
	    		$scope.showdetailtobox(ve);
	    		$(document.getElementById('tr'+ve)).after($("#rejectNotes"));   
	    		$(document.getElementById('tr'+ve)).css("background-color","#E1E7EC");
	         	$("#rejectNotes").show(500);
	         	$scope.now = 'tr'+ve;
	    	}else if($scope.now == 'tr'+ve){
	    		$("#rejectNotes").hide(500);
	
				$("#bb").css('display','none');
	    		$(document.getElementById('tr'+ve)).css("background-color","");
	    		$scope.now = null;
	    	}else if($scope.now != ve){
	    		$("#rejectNotes").css("display","none");
	    		$("#rejectNotes").hide(500);
				$("#bb").css('display','none');
	    		$(document.getElementById($scope.now)).css("background-color","");
	    		$scope.showdetailtobox(ve);
	    		$(document.getElementById('tr'+ve)).after($("#rejectNotes")); 
	    		$(document.getElementById('tr'+ve)).css("background-color","#E1E7EC");
	         	$("#rejectNotes").show(500);
	         	$scope.now = 'tr'+ve;
	    	}
		}else{
			$scope.disapprourl = "disapprovedbyapprover?dataid="+str+"&rejectNotes="+$scope.rejectNotes;
			$('#disapproverWarn').slideToggle("slow");
		}
		
	};
    $scope.donotdisapprover = function(ve){
    	$('#disapproverWarn').slideToggle("slow");
    };
    
    $scope.dodisapprover = function(){
    	
    	$.ajax({
	        type: "POST",
	        async:false,
	        url: $scope.disapprourl,
	        beforeSend: function () { 
			$('#shclKeyframes').show();
			 },
	        success: function(data){
				$('#disapproverWarn').slideToggle("slow");
	        	$scope.refresh();
	        	setTimeout(function(){
	        		var ids = dataId.split(',');
		        	for(t=0;t<ids.length-1;t++){
		        		 $('#tr'+ids[t]).css('background','#E1E7EC');
		        	}
	        	}, 500);
	        	
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
    };
    $scope.showComments = function(){ 	 	
   	        $scope.myVar = !$scope.myVar;	 	    
   	    if($scope.myVar){
   	    	$("#commentsDiv").css("display","none");
   	    }else{
   	    	$("#commentsDiv").css("display","block");
   	    }
	};
   
    $scope.showdetail = function(ve){
    	$scope.comments = "";
    	$('#commentsDiv').css('display','none');
    	$('#tbody3').html('');
    	if($scope.now == null){
    		$scope.showdetailtobox(ve);
    		$(document.getElementById('tr'+ve)).after($("#approverdetail"));   
    		$(document.getElementById('tr'+ve)).css("background-color","#E1E7EC");
         	$("#approverdetail").show(500);
         	$scope.now = 'tr'+ve;
         	setTimeout($scope.movetosuitable($scope.now),600);
    	}else if($scope.now == 'tr'+ve){
    		$("#approverdetail").hide(500);    	
    		$(document.getElementById('tr'+ve)).css("background-color","");
    		$scope.now = null;
    	}else if($scope.now != 'tr'+ve){
    		$("#approverdetail").css("display","none");
    		$("#approverdetail").hide(500);
    		$("#commentsDiv").css("display","none");
    		$(document.getElementById($scope.now)).css("background-color","");
    		$scope.showdetailtobox(ve);
    		$(document.getElementById('tr'+ve)).after($("#approverdetail")); 
    		$(document.getElementById('tr'+ve)).css("background-color","#E1E7EC");
         	$("#approverdetail").show(500);
         	$scope.now = 'tr'+ve;
         	setTimeout($scope.movetosuitable($scope.now),600);
    	}
    };
    
    $scope.movetosuitable = function(ve){
		var allheight = $('#tbodyapprover').offset().top + $('#tbodyapprover').height();
		var lineheight = $(document.getElementById(ve)).offset().top + $(document.getElementById(ve+",")).height();	
		var detailheight = 380;
		if(detailheight + lineheight> allheight){
			var move = detailheight + lineheight - allheight;
			$('#tbodyapprover').animate({scrollTop:'+=' + move + 'px'},500);
		}
	};
	
    $scope.showdetailtobox = function(ve){
    	for(var i=0;i<$scope.applications.length;i++){
    		if($scope.applications[i].dataId == ve){
    			$scope.selapplication = $scope.applications[i];
    			return;
    		}
    	}
    };
    
    $scope.focusme = function (ve){
    	$('#tbodyapprover').find('tr').not(document.getElementById($scope.now)).css('background','');
		$(document.getElementById('tr' + ve)).css('background','#E1E7EC');
    	};
	
	
    $scope.beginedit = function(){
    	document.getElementById("bar3").innerHTML="Edit";
    	$scope.newapplications = $scope.selapplication;
    	$scope.select();
    	$('#approverform').css("display","none");
    	$('#editpage').css("display","block");
    	$('#editpage').addClass("active");
    	$('#approverList').css("display","none");
    	$('#showemployee').removeClass("active");
    	$('#showapprover').removeClass("active");
    	$('#approverditform').css("display","block");
    };
    
    
    
    $scope.setCc = function(va){
		if(isExit(va)){
			return;
		}
		else{
			$scope.cc = $scope.cc+";"+va;
	    };
    };
	$scope.setApprover = function(va){
	    	$scope.approver = va;
	    };
	    
	$scope.setProgram = function(va){
	    	$scope.program = va;
	    };
    $scope.setPeriod = function(va,ve){
    	$scope.period.time = va;
    	$scope.period.value = ve;
    };
    $scope.setStatus = function(ve){
    	$scope.status = ve;
    };
    $scope.left  = function() {
    	return 500 - $scope.reason.length;
    };
    $scope.left2  = function() {
    	return 200 - $scope.rejectNotes.length;
    };
    $scope.left3  = function() {
    	return 200 - $scope.comments.length;
    };
    $scope.getthedate = function (){
    	// error check
		if($scope.time2!=""){
			
    	var a = new Date($scope.time2);
    	a = a.valueOf();
    	a = a + 1 * 24 * 60 * 60 * 1000;
    	a = new Date(a);
    	var m = a.getMonth() + 1;
    	if(m.toString().length == 1){
    	    m='0'+m;
    	}
    	var d = a.getDate();
    	if(d.toString().length == 1){
    	    d='0'+d;
    	}
    	$scope.time3 = a.getFullYear() + "-" + m + "-" + d;
		return $scope.time3;
			}
    };
    
    $scope.gettheMonth = function (){
		if($scope.time3!='' && ($scope.period.value==12||$scope.period.value==6)){
		
    	var ti = $scope.time2.split("-");
    	var year = parseInt(ti[0]);
    	var month =   parseInt(ti[1]);
    	var day =   parseInt(ti[2]);
    	if(parseInt($scope.period.value)==12){
    		year = year+1;
    	}
    	if(parseInt($scope.period.value)==6){
    		if(month>6){
    			year = year + 1;
    			month = month + 6 - 12;
    		}else{
    			month = month + 6;
    		}
    	}
    	if(month==2&&day==29){
    		day--;
    	}
    	if(month<10){
    		month = "0" + month;
    	}
    	if(day<10){
    		day= "0" + day;
    	}
		$scope.time4 = year + "-" + month + "-" + day;
    	return $scope.time4;
		}
    };
    
    $http.post("getallprogrambyJson")
    .success(function(data) {
    	$scope.allpro = data;
    }
    ).error(function(){
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
    
    function toObject1(a){
	    return (new Function('return ' + a))();
	};
	function toObject(a){
	    return (new Function('return ' + a))();
	};
	function toObject(a){
	    return (new Function('return ' + a))();
	};

//	 $http.post("getapplicationforapproverbyJson")
//	    .success(function(data) {
//			$scope.applications = data;
//	    	}
//	    ).error(function(){
//	    });
	
	 $.ajax({
	        type: "POST",
	        async:false,
	        url: "getapplicationforapproverbyJson",
	        beforeSend: function () { 
			$('#shclKeyframes').show();
			 },
	        success: function(data){ 
				 $scope.applications = eval(data);

			 //$('#shclKeyframes').hide();
			setTimeout(function(){$('#shclKeyframes').hide();},1000);
	     },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
	 $scope.refresh = function(){
		 $scope.moveTheDiv('approverdetail');
		 $scope.moveTheDiv('rejectNotes');
		 $scope.initBeforeRef();
		 	$('#shclKeyframes').show();
		 	$('#tbodyapprover').css('display','none');
			$scope.applications = "";
			$.ajax( {
				type : "POST",
				async : false,
				url : "getapplicationforapproverbyJson",
				beforeSend : function() {
					$('#shclKeyframes').show();
				},
				success : function(data) {
					$scope.applications = eval(data);
					setTimeout(function() {
						$('#tbodyapprover').css('display','block');
						$('#shclKeyframes').hide();
					}, 1000);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
				}
			});
			
		};
	 $scope.flag = false;
	 $scope.selectAll = function(){
		 
		 var checkbox1 = document.getElementsByName("submitted");
		 var checkbox2 = document.getElementsByName("resubmitted");
		 for(i=0;i<checkbox1.length;i++){
			 var temp = checkbox1[i];
			 if(!$scope.flag){
				 temp.checked = true;
			 }else{
				 temp.checked = false;
			 }
		}
		 for(i=0;i<checkbox2.length;i++){
			 var temp = checkbox2[i];
			 if(!$scope.flag){
				 temp.checked = true;
			 }else{
				 temp.checked = false;
			 }
		}
		 
		 $scope.flag = !$scope.flag;
	 }
	 
	 $scope.checkBox = function(status,dataId){
		 var checkbox = document.getElementById(dataId+',');
		 if(status=='submitted'||status=='resubmitted'){
			 if(checkbox.checked){
				 checkbox.checked = true;
			 }else{
				 checkbox.checked = false;
			 }
		 }else{
			 checkbox.checked  = false;
		 }
	 }
	 
	 $scope.moveTheDiv = function(divId){
	   	 $('#'+divId).hide(500);
			 $('#'+divId).css("display","none");
			 $(document.getElementById('count1')).after($('#'+divId));
	   }
	 
	 $scope.initBeforeRef = function(){
		 $(':checkbox')[0].checked = false;
			$scope.myfilter.empIdFilter = "";
			$scope.myfilter.empNameFilter = "";
	    	$scope.myfilter.trainingProgramFilter = "";
	    	$scope.myfilter.totalCostFilter = "";
	    	$scope.myfilter.companyCoverFilter = "";
	    	$scope.myfilter.servicePeriodFromFilter = "";
	    	$scope.myfilter.servicePeriodToFilter = "";
	    	$scope.myfilter.statusFilter = "";
	    }
	 
	 
	 $scope.moveTheComment = function(){
			$scope.comments = "";
	    	$('#commentsDiv').hide(500);
	    	$('#tbody3').html('');
		}
}






