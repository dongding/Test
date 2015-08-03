function father($scope,$http){
	$scope.empName = "";
	$scope.trainingProgram = "";
	$scope.totalCost = "";
	$scope.companyCover = "";
	$scope.updateDate = "";
	$scope.trainingInstitution = "";
	$scope.companyCoverRate = "";
	$scope.chineseName = "";
	$scope.identification = "";
	$scope.companyCoverCn = "";
	$scope.totalCostCn = "";
	$scope.yearCn = "";
	$scope.monthCn = "";
	$scope.dayCn = "";
	$scope.trainingPeriodFrom = "";
	$scope.trainingPeriodTo = "";
	$scope.agreement;
	
	$scope.checkAgreement = function(hasCertification,dataId){
		
		$scope.initAgreement();
		if(hasCertification!="1"){
			$.ajax({
	            type: "POST",
	            url: "showoneagreementbydataid?dataId="+dataId,
	            success: function(data){
	    		$scope.agreement = eval(data)[0];
	 		   $scope.$apply(function(){
	 			  $scope.getValue($scope.agreement);
	 		   });
	 		  document.getElementById("bar").innerHTML="Agreement View";
	    		$('#agreetab').css("display","block");
				$('#selecttab').children().removeClass('active');
				$('#agreetab').addClass('active');
				
				
				$('.agreementview').css("display","none");
				$('#agreementview').css("display","block");
				

				$('#agreeinfo').height($("#examp").height() - $("#info").height() - $('#selecttab').height()-60);
	    	},
	            error:function(XMLHttpRequest, textStatus, errorThrown){
	         }
	        });
		}

    };
	

	
    $scope.getValue = function(agreement){
    	$scope.empName = agreement.empName;
    	$scope.trainingProgram = agreement.trainingProgram;
    	$scope.totalCost = agreement.totalCost;
    	$scope.companyCover = agreement.companyCover;
    	$scope.updateDate = agreement.updateDate;
    	$scope.trainingInstitution = agreement.trainingInstitution;
    	$scope.companyCoverRate = agreement.companyCoverRate;
    	$scope.chineseName = agreement.chineseName;
    	$scope.identification = agreement.identification;
    	$scope.companyCoverCn = agreement.companyCoverCn;
    	$scope.totalCostCn = agreement.totalCostCn;
    	$scope.yearCn = agreement.yearCn;
    	$scope.monthCn = agreement.monthCn;
    	$scope.dayCn = agreement.dayCn;
    	$scope.trainingPeriodFrom = agreement.trainingPeriodFrom;
    	$scope.trainingPeriodTo = agreement.trainingPeriodTo;
   }
	
    $scope.initAgreement = function(){
 	   $scope.empName = "";
 		$scope.trainingProgram = "";
 		$scope.totalCost = "";
 		$scope.companyCover = "";
 		$scope.updateDate = "";
 		$scope.trainingInstitution = "";
 		$scope.companyCoverRate = "";
 		$scope.chineseName = "";
 		$scope.identification = "";
 		$scope.companyCoverCn = "";
 		$scope.totalCostCn = "";
 		$scope.yearCn = "";
 		$scope.monthCn = "";
 		$scope.dayCn = "";
 		$scope.trainingPeriodFrom = "";
 		$scope.trainingPeriodTo = "";
    }
	
    $scope.beginedit = function(ve){
    	var index = 2 ;
    	$('#selecttab').children().eq(index).css("display","block");
		$('#selecttab').children().not($('#selecttab').children().eq(index)).removeClass('active');
		$('#selecttab').children().eq(index).addClass('active');
    }

}
