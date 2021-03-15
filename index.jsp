<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ include file="/public/jsps/taglibs.jsp"%>
<%@taglib prefix="ec" tagdir="/WEB-INF/tags"%>


<head>   
      <title><fmt:message key="index.title"/></title>	
      <link href="${ctxPath}/public/scripts/plugins/artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" /> 
      <link href="${templatePath}/css/kline.css" rel="stylesheet" type="text/css" /> 
 </head>

    	<div class="homepage-box-top">		
    		<div class="participate-boxcon">	
    	  

		
			<div class="boxbg-line szqq-line">
			
				
			<!--实时区块-->
			<div class="cbjh_box">	
				<div class="bcon kxtu-main">
				    <div id="zybpdiv2"><span><fmt:message key="callOption.amount.title"/></span><span id="bwOfFree">0USDT</span></div>
					<h2 class="rgu_tit">
					<!-- 	<div class="eth-title">ETH/USDT</div> -->
						 <div class="kxtu-box" id="klineDiv" style="width:95%;height:300px; margin: 0 auto;"></div> 
					</h2>
					
					<!--看涨看跌-->
				<div class="kzd-main">
			         <div class="setAmount1">	
					    <input type="text" class="spinnerExample"  name="amount" id="amount"/>  
					</div>  	
									
					<p class="kjbtn-btn">			
		                <button id="btn_up_fixed" class="kjbtn bggreed" type="button" onClick="joinCallOption(1)"><b><img src="${templatePath}/images/kz.png" alt=""></b><span><fmt:message key="callOption.buyUp"/><i><!--<fmt:message key="callOption.profit"/>--><fmt:formatNumber value="${callOptionDrpConfig.p6*100+100 }" type="number"  maxFractionDigits="0"/>%</i></span></button>
						<button id="btn_down_fixed" class="kjbtn bgred" type="button" onClick="joinCallOption(2)"><b><img src="${templatePath}/images/kd.png" alt=""></b><b></b><span><fmt:message key="callOption.buyDown"/><i><!--<fmt:message key="callOption.profit"/>--><fmt:formatNumber value="${callOptionDrpConfig.p7*100+100 }" type="number"  maxFractionDigits="0"/>%</i></span></button>
						</p>
				</div>	
					
				    <!--<div class="titie-ssk"><fmt:message key="upDownOrder.dataFrom"/>:<img src="${templatePath}/images/bian.png" style="width:1.5rem;height: 1.5rem;"><img src="${templatePath}/images/okex.png" style="width:1.5rem;height: 1.5rem;"><img src="${templatePath}/images/huobi.png" style="width:1.5rem;height: 1.5rem;"></div>-->
					
				</div>		
				
				<!--历史明细 开始-->
				
				<div class="pm_tilist szqq-list wdcy-conm" id="myUpDownOrderHeaders">
					<div class="szqq-title">
						<button class="tzbtn1" type="button" onClick="dappLoadUpDownOrdersByRegion(2)" id="btnLoadOrder"><fmt:message key="button.upDownOrders"/></button>
					   <a href="javascript:doJoinAi()" id="aia"  class="aiuna"><img src="${templatePath}/images/unchecked.png" id="aiImg"/><%-- <fmt:message key="callOption.aiTrade.title"/> --%></a>
						<button class="tzbtn2" type="button" onClick="dappLoadUpDownOrdersByRegion(1)" id="btnLoadAiOrder"><fmt:message key="button.aiTradeOrder"/></button>
					</div>
					<dt>					   
						<span class="wb20"><fmt:message key="upDownOrder.time"/></span>						
						<span class="wb20"><fmt:message key="upDownOrder.price"/></span>
						<span class="wb25"><fmt:message key="upDownOrder.amount"/></span>
						<span class="wb20"><fmt:message key="upDownOrder.result"/></span>
						<span class="wb15"><fmt:message key="upDownOrder.bonus"/></span>
					</dt>			
					<ul class="pmlist_box szqq-list" id="myUpDownOrders">
						<li>
							<div class="wumx">
								<fmt:message key="msg.nothing" />
							</div>
						</li>
					</ul>
					<ul class="pmlist_box szqq-list" id="aiUpDownOrders" style="display:none">
						<li>
							<div class="wumx">
								<fmt:message key="msg.nothing" />
							</div>
						</li>
					</ul>
				</div>
				</div>	
							
			</div>
			
		</div>	
			
			
		<!--个小模块-->
		<div class="personal-boxmain">
			 <form name="investForm" id="investForm">
    	      <input type="hidden" name="contractAddr" id="contractAddr" value="${contractAddr }"/>
    	      <input type="hidden" name="token" id="token" value="${_token }"/>
    	      <input type="hidden" name="balance" id="balance" value="0"/>
    	      <input type="hidden" name="recommendDistributor" id="recommendDistributor" value="${not empty ref ?ref:'0x0000000000000000000000000000000000000000'}"/>
    	      <input type="hidden" name="account" id="account" value=""/>
    	      <input type="hidden" name="restJoinAmount" id="restJoinAmount" value="0"/>
    	      <input type="hidden" name="restJoinTimes" id="restJoinTimes" value="0"/>
    	      <input type="hidden" name="bw" id="bw" value="0"/>
    	      <input type="hidden" name="coinType" id="coinType" value="ETH"/>
    	      <input type="hidden" name="region" id="region" value="2"/>
    	      <input type="hidden" name="diffSecond" id="diffSecond" value="${diffSecond }"/>
    	      <input type="hidden" name="pledgeAmount" id="pledgeAmount" value="${curMembership.pledgeAmount}"/>  
    	      <input type="hidden" name="membershipId" id="membershipId" value="${curMembership.membershipId}"/>  
    	      <input type="hidden" name="withdrawAccount" id="withdrawAccount" value=""/>
    	      <input type="hidden" name="dw" id="dw" value=""/>  
    	      <input type="hidden" name="isJoined" id="isJoined" value="0"/>    	     
    	      <!--参与-->
			<div class="djsmain boxbg-line djsyiny">
				<div class="yuebox"><span id="balanceOfUsdt">0</span><p><fmt:message key="index.balance"/>USDT</p></div>		
				<div class="setAmount">	
				    <input type="text" class="spinnerExample"  name="investAmount" id="investAmount"/>  
				</div>   										
				<button class="tzbtn yecybtn" type="button" onClick="doJoinInvest()" id="btnJoin"><fmt:message key="index.btnJoin"/></button>	
			</div>
						
			<div class="djsmain boxbg-line djsyiny zysjbox">
				<ul id="pledgeDiv">	
				   <c:forEach items="${ memberships}" var="membership" varStatus="status">
				     <c:if test="${membership.pledgeAmount gt 0 }">
				      <c:if test="${not empty curMembership }">
				       <c:if test="${membership.membershipLevel lt  curMembership.membershipLevel }">
				          <li class="zy_no" id="membership_${membership.membershipId }" data-pledgeAmount="${membership.pledgeAmount}"><a href="javascript:void(0)">${membership.membershipName}<i><fmt:formatNumber type="number" value="${membership.pledgeAmount}" pattern="0" maxFractionDigits="2"/>U</i></a></li>
				       </c:if>
				        <c:if test="${membership.membershipLevel eq  curMembership.membershipLevel }">
				          <li class="zy_on" id="membership_${membership.membershipId }" data-pledgeAmount="${membership.pledgeAmount}"><a href="javascript:selectMembership('${membership.membershipId}','${membership.pledgeAmount }')">${membership.membershipName}<i><fmt:formatNumber type="number" value="${membership.pledgeAmount}" pattern="0" maxFractionDigits="2"/>U</i></a></li>
				       </c:if>  
				       <c:if test="${membership.membershipLevel gt  curMembership.membershipLevel }">
				          <li class="" id="membership_${membership.membershipId }" data-pledgeAmount="${membership.pledgeAmount}"><a href="javascript:selectMembership('${membership.membershipId}','${membership.pledgeAmount }')">${membership.membershipName}<i><fmt:formatNumber type="number" value="${membership.pledgeAmount}" pattern="0" maxFractionDigits="2"/>U</i></a></li>
				       </c:if>
				     </c:if>
				      <c:if test="${ empty curMembership }">
				         <li class="" id="membership_${membership.membershipId }" data-pledgeAmount="${membership.pledgeAmount}"><a href="javascript:selectMembership('${membership.membershipId}','${membership.pledgeAmount }')">${membership.membershipName}<i><fmt:formatNumber type="number" value="${membership.pledgeAmount}" pattern="0" maxFractionDigits="2"/>U</i></a></li>
				      </c:if>         
				     </c:if>  
				     
				   </c:forEach>
				</ul>   										
				<button class="tzbtn zycybtn" type="button" onClick="doPledgeAmount()" id="btnPledgeJoin"><fmt:message key="index.btnPledgeAmount"/></button>	
			</div>
			
		</form>	
			
			
			<div class="box-top-left boxbg-line">
				<ul>
				  <li><span><fmt:message key="index.bw"/><i id="bwSpan">0</i><button id="btnWithdraw" onClick="dappWithdraw()"><fmt:message key="button.transfer"/></button></span><em class="gtjj-ico"></em></li>
				  <li><span><fmt:message key="index.invideCode"/><i id="invideCode">-</i><button class="urlCopy"><fmt:message key="button.copy"/></button></span><em class="yq-ico"></em></li>
		 		  <li><span><fmt:message key="index.totalInput"/><i id="totalInput">0 USDT</i></span><em class="cy-ico"></em></li>
		 		  <li><span><fmt:message key="index.membership"/><i id="membership"><fmt:message key="msg.none"/></i></span><em class="dqrg-ico"></em></li>		 			
		 	  			
				<li>
					<span>
						<fmt:message key="index.teamJoinAmount"/>
						<i><fmt:message key="index.teamJoinAmount.free"/><span id="teamJoinAmountFree">0 USDT</span></i> 
						<i><fmt:message key="index.teamJoinAmount.fixed"/><span id="teamJoinAmountFixed">0 USDT</span></i>							
					</span>
					<em class="ssje-ico"></em>
				</li>					
	 			<li>
	 				<span>
	 					<fmt:message key="index.joinAmount"/>
	 					<i><fmt:message key="index.joinAmount.free"/><span id="totalJoinAmountFree">0 USDT</span></i> 
						<i><fmt:message key="index.joinAmount.fixed"/><span id="totalJoinAmountFixed">0 USDT</span></i>											
	 				</span>
	 				<em class="ztws-ico"></em>
	 			</li>
	 			
		 			<%-- 
				  <li><span><fmt:message key="index.balanceBonus"/><i id="balanceBonus">0 USDT</i></span><em class="jdjj-ico"></em></li> --%>
				  <li><span><fmt:message key="index.ew"/><i id="ew">0 USDT</i></span><em class="navico1"></em></li>
				  <li><span><fmt:message key="index.rw"/><i id="rw">0 USDT</i></span><em class="navico2"></em></li>  	
		   		  <li><span><fmt:message key="index.totalStaticBonus"/><i id="totalStaticBonus">0 USDT</i></span><em class="navico7"></em></li>		
			      <li><span><fmt:message key="index.pledgeAmount"/><i id="pledgeAmountSpan">0 USDT</i><button  type="button" onClick="dappReleasePledge()" id="btnRealse">释放</button></span><em class="navico3"></em></li>
				  <li><span><fmt:message key="index.subordinateQty"/><i id="subordinateQty">0</i></span><em class="navico8"></em></li>		
				  <li><span><fmt:message key="index.teamQty"/><i id="teamQty">0</i></span><em class="navico9"></em></li> 
		  	      <li><span><fmt:message key="index.totalIncome"/><i id="totalIncome">0 USDT</i></span><em class="navico3"></em></li>		  	      
		  		<%--   <li><span><fmt:message key="index.teamInput"/><i id="teamInput">0 USDT</i></span><em class="navico4"></em></li>  --%>
		  		
		  		   <li><span><fmt:message key="index.totalEnergy"/>：<i  id="totalEnergy">0 ETH2</i></span><em class="navico4"></em></li>
		  	       <li><span><fmt:message key="index.restEnergy"/><i id="restEnergy">0 ETH2</i></span><em class="navico5"></em></li>
		  		   <li><span><fmt:message key="index.dw"/><i  id="dwSpan">0 ETH2</i><%-- <button id="btnWithdrawDw" onClick="dappWithdrawDw()"><fmt:message key="button.transfer"/></button> --%></span><em class="navico6"></em></li>
		  		 <%--   <li><span><fmt:message key="index.totalEnergy"/>：<i  id="totalEnergy">0 ETH2</i></span><em class="navico6"></em></li> --%>
		  		
		  		 
		  	  		  		
				</ul>
			</div>
			
		</div>	
		
	</div>
		
	
    
<script src="${ctxPath}/public/scripts/blockchain/web3/web3.min.js" type="text/javascript"></script> 		
<script src="${templatePath}/js/contractAbi.js" type="text/javascript"></script>
<script src="${templatePath}/js/usdtContractAbi.js" type="text/javascript"></script>
	
<script type="text/javascript">   
	$(function(){
		  updateUi();	
	      window.addEventListener('load', async () => {         
	  	          if (window.ethereum) {		
	  				   window.web3 = new Web3(ethereum);
	  				   try {
	  				      //Request account access if needed     				    
	  				      await ethereum.enable();	
	  				      dappAccountsChanged();			   
	  				   } catch (error) {
	  				     	fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	  				   }
	  			  }else if(window.web3) { // Legacy dapp browsers...
	  					window.web3 = new Web3(web3.currentProvider);			      
	  					dappAccountsChanged();	
	  			  }else{ // Non-dapp browsers...
	  				  fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
	  			  }
	     }); 
	      
	      //复制
    	 var clipboard =  new ClipboardJS('.urlCopy', {
    		    text: function(trigger) {    		    	
    		    	var url="";
    		    	var account=$("#account").val();
    		    	if(account!=null&&account!=""){
    		    		url="${homePage}?ref="+account;
    		    	}   
    		        return url;
    		    }
    	});
	    clipboard.on('success', function(e) {
	    	var account=$("#account").val();
	    	if(account==null||account==""){
	    		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	    	}else{
	    		fnAlert("<fmt:message key="button.copyLink.isOk"/>")
	    	}
			
		});
		clipboard.on('error', function(e) {	
			fnAlert("<fmt:message key="button.copyWalletAddr.noSupport"/>"+e);
		}); 
       	
			
	     //投资金额
	   	 $('#investAmount').spinner({value:1,isFloat:false});    
	    //包赔区
	      $('#amount').spinner({step:1,value:1});
	  
	  
	  
  });
  
  </script>
  
<script>
  //修改界面数据
  function updateUi(){  
      dappGetCustomerInfo();   
      dappLoadUpDownOrders();      
      dappGetBalance();    
      dappGetTeamInfo();      
  }
  

  //获取账号
  function dappAccountsChanged(){  
  	 if(typeof web3=='undefined'||web3.currentProvider==null){
  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
  		return;
  	}
  	if(web3.currentProvider==null){
		   return;
	     }	  
  	  web3 = new Web3(web3.currentProvider);	
  	  web3.eth.getAccounts(function(error,accounts){  
  		    var account=accounts[0];
  		    $("#account").val(account);     
  		    var len=account.length
  		    $("#invideCode").html(addStar(account,len));
  		    $(".link_url").html("${homePage}?ref="+account);
            localStorage.setItem("_account",accounts[0]);  
            var dt=new Date();
      	    dt.setTime(dt.getTime()+24*60*60*1000*7)
            setCookie("_account",accounts[0],dt,"","","");
            updateUi(); 
  	   });
  	
  }
  
  //获取余额
   function dappGetBalance(){   
   if(typeof web3=='undefined'||web3.currentProvider==null){	  	
  		return;
  	}
  	 var account= localStorage.getItem("_account");  
  	 if(account!=null&&account!=""&&account!="undefined"){  
  		 web3 = new Web3(web3.currentProvider);	
  		 var usdtContract=new web3.eth.Contract(usdtContractAbi,"${usdtContractAddr}");
		 usdtContract.methods.balanceOf(account).call(function(error, result){ 
			 if(result!=null&&result!=""){
				 var eth=web3.utils.fromWei(result,"mwei");
		     	// var eth=result;
		   		 $("#balance").val(formatFloat5(eth));
  		 	     $("#balanceOfUsdt").html(formatFloat5(eth)); 				 
			 }		     	
		 });
  	 }
  	 
  }    

   //获取会员信息
   function dappGetCustomerInfo(){      	
  	 if(typeof web3=='undefined'||web3.currentProvider==null){
  		 return;
  	}
  	 var account= localStorage.getItem("_account");
  	 if(account!=null&&account!=""&&account!="undefined"){	  		
 		 $.post(_g.ctxPath+"/customer/getAccountInfo.html?decorator=blank", {"account":account},
			function(rdata){
 		      var data=$.parseJSON(rdata);
	   		  if(data==null){
	      			return;
	      	  }	 
	   		  
	   		  $("#membership").html(data.membership);
	   		  $("#bwSpan").html(data.bw+"USDT");//可用钱包
	   		  $("#bw").val(data.bw);//可用钱包
	   		  $("#totalInput").html(data.totalInput+"USDT");//本金
	   		  $("#totalJoinAmountFree").html(data.totalJoinAmountFree+"USDT");	//累计个人流水	  
	   		  $("#totalJoinAmountFixed").html(data.totalJoinAmountFixed+"USDT");	//累计个人流水	  
	   		  
	   		  $("#teamJoinAmountFree").html(data.teamJoinAmountFree+"USDT");//累计团队流水
	   		  console.log(data.teamJoinAmountFixed);
	   		  $("#teamJoinAmountFixed").html(data.teamJoinAmountFixed+"USDT");//累计团队流水
	   		  $("#totalStaticBonus").html(data.totalStaticBonus+"USDT");//累计分红	   		  
	   		  $("#totalIncome").html(data.totalIncome+"USDT");//累计收益
	   		  $("#teamInput").html(data.teamInput+"USDT");//累计业绩
	   		  $("#restEnergy").html(data.restEnergy+"ETH2");//待释放能量
	   		  $("#dwSpan").html(data.dw+"ETH2");//可提能量
	   		  $("#dw").val(data.dw);
	   		  $("#totalEnergy").html(data.totalEnergy+"ETH2");//累计能量
	   		  
	   		  $("#realseBonus").html(data.realseBonus+"USDT");//可释放奖金
	   		  $("#restRealseBonus").html(data.restRealseBonus+"USDT");//待释放释放奖金
	   		  $("#restJoinAmountSpan").html(data.restJoinAmount+"USDT");//可投金额
	   		  $("#restJoinAmount").val(data.restJoinAmount);
	   		  $("#restJoinTimesSpan").html(data.restJoinTimes);
	   		  $("#restJoinTimes").val(data.restJoinTimes);
	   		  $("#fixed_amount").val(data.maxAmtPerTimes);
	   		
	   		  $("#dynamicBonus").html(data.dynamicBonus+"USDT");
	   		  $("#ew").html(data.ew+"USDT");
	   		  $("#rw").html(data.rw+"USDT");
	   		  $("#balanceBonus").html(data.balance+"USDT");	   		 
	   		  
	   		  $("#bwOfFree").html(data.bw+"USDT");
	   		  
	   		  $("#withdrawAccount").val(data.withdrawAccount);
	   		  
	   		  var isActiveAuto=data.isActiveAuto;
	   		  if(isActiveAuto==1){
	   			    $("#aiImg").attr("src",_g.templatePath+"/images/checked.gif");
					$("#aia").attr("disabled","disabled");
	   		  }
	   		  
	   		  $("#pledgeAmountSpan").html(data.pledgeAmount+"USDT");
	   		  $("#pledgeAmount").val(data.pledgeAmount);
		   	  $("#pledgeDiv>li").each(function( index ){    		
		     		if($(this).hasClass("zy_on")){
		     			 $("#pledgeAmount").val($(this).attr("data-pledgeAmount"));
		     		}
		      });
	   		 
	   	    }
	      );  	
      
  	 }	
   }

   //获取会员信息
   function dappGetTeamInfo(){      	
  	 if(typeof web3=='undefined'||web3.currentProvider==null){
  		 return;
  	}
  	 var account= localStorage.getItem("_account");
  	 if(account!=null&&account!=""&&account!="undefined"){	  		
 		 $.post(_g.ctxPath+"/customer/getTeamInfo.html?decorator=blank", {"account":account},
			function(rdata){
 		      var data=$.parseJSON(rdata);
	   		  if(data==null){
	      			return;
	      	  }
	   		  $("#subordinateQty").html(data.subordinateQty);
	   		  $("#teamQty").html(data.teamQty);
	   	    }
	      );  	
      
  	 }	
   }
  
   function doJoinInvest(){  
	   var token=$("#token").val();    
	   var account= localStorage.getItem("_account");		
	 	if(account==null||account==""){
	  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	  		return;
	  	}      
	  	
	    var recommendDistributor=$("#recommendDistributor").val();		
	   	var amount=$("#investAmount").val();      	
	    var isDouble=validateDouble(amount);
	   	if(!isDouble){
	   		fnAlert("<fmt:message key="msg.validNumber.hint"/>");
	   		return;
	   	}  
		if(parseFloat(amount)<1){
	   		fnAlert("<fmt:message key="msg.amount.isLessZero"/>");
	   		return;
	   	}  
	 
	   	
		var inputAmt=web3.utils.toWei(amount, 'mwei');   		 
	   	var balance=$("#balance").val();  
	   	if(parseFloat(amount)>parseFloat(balance)){    		
	   		fnAlert("<fmt:message key="msg.balanceIsLess"/>");
	   		return;
	   	}   	   
	 
	    if(typeof web3=='undefined'||web3.currentProvider==null){
				 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
			     return;
		}
	  	var transactionHash="";
	  	web3 = new Web3(web3.currentProvider);		  
	    var usdtContract=new web3.eth.Contract(usdtContractAbi,"${usdtContractAddr}");	
	    usdtContract.methods.transfer("${companyWallet.account}",inputAmt).send({from: account,gas:60000,gasPrice: '${gasPrice}'},function(error, hash){ 
	 				  if(error==null){
		      				 transactionHash=hash;	
		      				 $.post(_g.ctxPath+"/investOrder/invest.html?decorator=blank", {"transactionHash":transactionHash,"account":account,"ref":recommendDistributor,"amount":inputAmt},
			        	 	  			function(data){		
			        	 	  				if(data==""){
			        	 	  					fnAlertCall("<fmt:message key="msg.invest.ok"/>",function(){
			        	 	  					 	updateUi();
			        	 	  					});
			        	 	  				}else{
			        	 	  					fnAlert(data);
			        	 	  				}
			        	 	  				
			        	 	 		    }
			        	 	      	);  	
		      			}else{		
		      				 $.post(_g.ctxPath+"/investOrder/invest.html?decorator=blank", {"transactionHash":transactionHash,"account":account,"ref":recommendDistributor,"amount":inputAmt},
		      						function(data){			      					 
		      				        }
		      				 );
		      						 
		      				fnAlert("<fmt:message key="msg.invest.err"/>");  
		      			}	        	
		 });
}

	  
	  function dappWithdraw(){			
		    if(typeof web3=='undefined'||web3.currentProvider==null){
				 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
	  		     return;
	  		}	
			var title="${withdrawTitle}";
			var inputDxg=fnInput(title,function(){
				var num=$("#_dialog_input").val();			
				if(num==null||num==""){
					fnAlert("<fmt:message key="dialog.input.hint"/>");	   
					return false;
				}
				 var isNumber=validateDouble(num)
				if(!isNumber){
					fnAlert("<fmt:message key="msg.validNumber.hint"/>");	   
					return false;
				} 
				num=parseFloat(num);
				if(num<0.01){
					 fnAlert("<fmt:message key="transfer.amount.isLess"/>");	   
					 return false;
				}
				var existNum=$("#bw").html();			
				existNum=parseFloat(existNum);
				if(num>existNum){
					fnAlert("<fmt:message key="dialog.input.max.hint"/>"+existNum);	   
					 return false;
				}

				 $("#btnWithdraw").attr("disabled","disabled");
				 $(".ui-dialog-autofocus").attr("disabled","disabled");				
				 var dt=(new Date()).getTime();
				var account=$("#account").val();  				  
				 $.post(_g.ctxPath+"/distributor/withdraw/dappAplyWithdraw.html?decorator=blank&orderType=options", {"account":account,"totalAmount":num,"dt":dt},
	   	 	  			function(data){		
					        $("#btnWithdraw").removeAttr("disabled");
	   	 	  				if(data==""){
	   	 	  					fnAlertCall("<fmt:message key="msg.withdraw.ok"/>",function(){
	   	 	  					    window.showhanDialog.close();
	   	 	  						dappGetCustomerInfo();		     	 	  					
	   	 	  						return true;
	   	 	  					});
	   	 	  				}else{
	   	 	  				    $(".ui-dialog-autofocus").removeAttr("disabled");		
	   	 	  					fnAlert(data);	     	 	  				
	   	 	  				    return true;
	   	 	  				}
	   	 	 		    }
	   	 	      	);  	
					      		
				});
					
		}
		
	



    function joinCallOption(direction){     	
        var region=$("#region").val();
    	if(web3.currentProvider==null){
			 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
 		     return;
 		}	
    	var account= localStorage.getItem("_account");		
	 	if(account==null||account==""){
	  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	  		return;
	  	}   
	 	var isJoined=$("#isJoined").val();
	 	if(isJoined==1){
	 		fnAlert("<fmt:message key="upDownOrder.existUnOpenOrder"/>");	   
	    	return ;
	 	}
    	if(region==1){//包赔区域    	
    		var inputAmount=$("#amount").val();  
    	    if(inputAmount==null||inputAmount==""){
    	    	fnAlert("<fmt:message key="callOption.amount.isRequired"/>");	   
    	    	return ;
    	    }
    	    var restJoinTimes=$("#restJoinTimes").val();  
    	    if(restJoinTimes!=null&&restJoinTimes!=""){
    	    	var i_restJoinTimes=parseInt(restJoinTimes);
    	    	if(i_restJoinTimes<1){
    	    		fnAlert("<fmt:message key="callOption.times.isCompleted"/>");	   
        	    	return ;
    	    	}
    	    }    		
    		var restJoinAmount=$("#restJoinAmount").val();  
    		var f_restJoinAmount=parseFloat(restJoinAmount);    		
		   	if(parseFloat(inputAmount)>f_restJoinAmount){    		
		   		fnAlert("<fmt:message key="callOption.amount.balanceIsLess"/>");
		   		return;
		   	}  
		   	var msg="";
		   	if(direction==1){
		   		msg="<fmt:message key="callOption.op.up.hint"/><b style='color:#ff0000'>"+inputAmount+"</b>USDT";
		   	}else if(direction==2){
		   		msg="<fmt:message key="callOption.op.down.hint"/><b style='color:#ff0000'>"+inputAmount+"</b>USDT";
		   	}
		   	var coinType=$("#coinType").val();	   		
		   	fnConfirm(msg,function(){			   		
	   	          $.post(_g.ctxPath+"/game/upDownOrder/join.html?decorator=blank", {"account":account,"amount":inputAmount,"region":1,"direction":direction,"coinType":coinType},
					function(rdata){
					      if(rdata==null||rdata==""){
					    	  //调用k线图
					    	  kline.buy(direction-1);    	
					    	  dappGetCustomerInfo();
					    	  dappLoadUpDownOrdersByRegion(2);
					    	  fnAlert("<fmt:message key="callOption.op.ok"/>");
					      }else{
					    	  fnAlert(rdata);
					      }
				    }
				 );  
		   	});
			
    	}else if(region==2){//自由区域
    		var inputAmount=$("#amount").val();  
    
    	    if(inputAmount==null||inputAmount==""){
    	    	fnAlert("<fmt:message key="callOption.amount.isRequired"/>");	   
    	    	return ;
    	    }
    	   		
    		var bw=$("#bw").val(); 
    		var f_bw=parseFloat(bw);        		
		   	if(parseFloat(inputAmount)>f_bw){    		
		   		fnAlert("<fmt:message key="callOption.amount.balanceIsLess"/>");
		   		return;
		   	}  		 
		   	var msg="";
		   	if(direction==1){
		   		msg="<fmt:message key="callOption.op.up.hint"/><b style='color:#ff0000'>"+inputAmount+"</b>USDT";
		   	}else if(direction==2){
		   		msg="<fmt:message key="callOption.op.down.hint"/><b style='color:#ff0000'>"+inputAmount+"</b>USDT";
		   	}
		
			var coinType=$("#coinType").val();
		   	fnConfirm(msg,function(){		   		
	   	          $.post(_g.ctxPath+"/game/upDownOrder/join.html?decorator=blank", {"account":account,"amount":inputAmount,"region":2,"direction":direction,"coinType":coinType},
					function(rdata){	   	        	 
					      if(rdata==null||rdata==""){
					    	  $("#isJoined").val(1);
					    	  //调用k线图					    	  
					    	   kline.buy(direction-1);    
					    	   dappGetCustomerInfo();
					    	   dappLoadUpDownOrdersByRegion(2);
					    	  fnAlert("<fmt:message key="callOption.op.ok"/>");
					      }else{
					    	  fnAlert(rdata);
					      }
				    }
				 );  
		   	});
    	}
    }
    function dappLoadUpDownOrders(){    	
    	 if($("#myUpDownOrders").is(':hidden')){　
    		dappLoadUpDownOrdersByRegion(1);
    	}else{
    		dappLoadUpDownOrdersByRegion(2);
    	} 
    }
    function dappLoadUpDownOrdersByRegion(region){   
     	var account= localStorage.getItem("_account");		
	 	if(account==null||account==""){
	  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	  		return;
	  	} 
	 	if(region==2){
	 		$("#btnLoadOrder").removeClass("tzbtn1")
		 	$("#btnLoadOrder").removeClass("tzbtn2")
			$("#btnLoadAiOrder").removeClass("tzbtn1")
			$("#btnLoadAiOrder").removeClass("tzbtn2")	 
		 	
		 	$("#btnLoadOrder").addClass("tzbtn1")
		 	$("#btnLoadAiOrder").addClass("tzbtn2")
		 
		 	$("#myUpDownOrders").show();
		 	$("#aiUpDownOrders").hide();
		 	
		    $.post(_g.ctxPath+"/game/upDownOrder/findMyUpOrDownOrders.html?decorator=blank", {"account":account,"region":region},
		 			 function(data){	    	       
		 		       $("#myUpDownOrders").html(data);
		 	 });
	 	}else{
	 		$("#btnLoadOrder").removeClass("tzbtn1")
		 	$("#btnLoadOrder").removeClass("tzbtn2")
			$("#btnLoadAiOrder").removeClass("tzbtn1")
			$("#btnLoadAiOrder").removeClass("tzbtn2")	
		 	
		 	
		 	$("#btnLoadAiOrder").addClass("tzbtn2")
		 	$("#btnLoadAiOrder").addClass("tzbtn1")
		 	
		 	$("#myUpDownOrders").hide();
		 	$("#aiUpDownOrders").show();
		 	
		    $.post(_g.ctxPath+"/game/upDownOrder/findMyUpOrDownOrders.html?decorator=blank", {"account":account,"region":region},
		 			 function(data){	    	       
		 		       $("#aiUpDownOrders").html(data);
		 	 });
	 	}
	 	
	 	
    }
   

	function selectMembership(membershipId,pledgeAmount){
	    $("#membershipId").val(membershipId);
	    $("#pledgeAmount").val(pledgeAmount);
	    $("#pledgeDiv>li").each(function( index ){    		
    		$(this).removeClass("zy_on");
    	});
	    $("#membership_"+membershipId).addClass("zy_on");
	}
	
	function doPledgeAmount(){
		var account= localStorage.getItem("_account");		
	 	if(account==null||account==""){
	  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
	  		return;
	  	}   
		var pledgeAmount=$("#pledgeAmount").val();
		var membershipId=$("#membershipId").val();
		if(membershipId==null||membershipId.length<=0){
			 fnAlert("<fmt:message key="msg.membership.isRequired"/>");
			 return;
		}		
		var msg="<fmt:message key="msg.pledge.hint"/>"+pledgeAmount;
		$("#btnPledgeJoin").attr("disabled","disabled");
		fnConfirm(msg,function(){		   		
 	          $.post(_g.ctxPath+"/pledgeOrder/savePledgeOrder.html?decorator=blank", {"account":account,"membershipId":membershipId},
				function(rdata){	
 	        		$("#btnPledgeJoin").removeAttr("disabled");
				      if(rdata==null||rdata==""){
				    	  dappGetCustomerInfo();
				    	  fnAlert("<fmt:message key="msg.pledge.ok"/>");
				      }else{
				    	  fnAlert(rdata);
				      }
			    }
			 );  
	   	});
		$("#btnPledgeJoin").removeAttr("disabled");
	}
	
	  function dappReleasePledge(){    	
	    	if(web3.currentProvider==null){
				 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
			     return;
			}	
	     	var account= localStorage.getItem("_account");		
		 	if(account==null||account==""){
		  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
		  		return;
		  	} 
		 	$("#btnRealse").attr("disabled","disabled");
		    $.post(_g.ctxPath+"/pledgeOrder/releasePledgeOrder.html?decorator=blank", {"account":account},
		    		function(rdata){
				      if(rdata==null||rdata==""){
				    	   dappGetCustomerInfo();
				    	  fnAlert("<fmt:message key="msg.op.ok"/>");
				      }else{
				    	  fnAlert(rdata);
				      }
		    	}
		  );  
					
	    }
	  
	  function dappWithdrawDw(){			
		    if(typeof web3=='undefined'||web3.currentProvider==null){
				 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
	  		     return;
	  		}	
		    var _withdrawAccount=$("#withdrawAccount").val();
			var existNum=$("#dw").val();			
		    
			var title="${withdrawTitle}";
			var content="<fmt:message key="msg.withdraw.withdrawAccount"/><input type='text' name='_dialog_withdraw_account' id='_dialog_withdraw_account' value='"+_withdrawAccount+"'/><br/>";
			 content=content+"<fmt:message key="msg.withdraw.amount"/><input type='text' name='_dialog_withdraw_amount' id='_dialog_withdraw_amount' value='"+existNum+"'/><br/>";
			
			var inputDxg=fnRawDialog(title,content,function(){
				var withdrawAccount=$("#_dialog_withdraw_account").val();			
				if(withdrawAccount==null||withdrawAccount==""){
					fnAlert("<fmt:message key="msg.withdraw.withdrawAccount.isRequired"/>");	   
					return false;
				}
				
				var num=$("#_dialog_withdraw_amount").val();			
				if(num==null||num==""){
					fnAlert("<fmt:message key="dialog.input.hint"/>");	   
					return false;
				}
				 var isNumber=validateDouble(num)
				if(!isNumber){
					fnAlert("<fmt:message key="msg.validNumber.hint"/>");	   
					return false;
				} 
				num=parseFloat(num);
				if(num<1){
					 fnAlert("<fmt:message key="msg.withdraw.amount.hint"/>");	   
					 return false;
				}
			
				existNum=parseFloat(existNum);
				if(num>existNum){
					fnAlert("<fmt:message key="dialog.input.max.hint"/>"+existNum);	   
					 return false;
				}

				 $("#btnWithdrawDw").attr("disabled","disabled");
				 $(".ui-dialog-autofocus").attr("disabled","disabled");				
				 var dt=(new Date()).getTime();
				var account=$("#account").val();  				  
				 $.post(_g.ctxPath+"/distributor/withdraw/dappAplyWithdrawDw.html?decorator=blank&orderType=options", {"account":account,"withdrawAccount":withdrawAccount,"totalAmount":num,"dt":dt},
	   	 	  			function(data){		
					        $("#btnWithdrawDw").removeAttr("disabled");
	   	 	  				if(data==""){
	   	 	  					fnAlertCall("<fmt:message key="msg.withdraw.ok"/>",function(){
	   	 	  					    window.showhanDialog.close();
	   	 	  						dappGetCustomerInfo();		     	 	  					
	   	 	  						return true;
	   	 	  					});
	   	 	  				}else{
	   	 	  				    $(".ui-dialog-autofocus").removeAttr("disabled");		
	   	 	  					fnAlert(data);	     	 	  				
	   	 	  				    return true;
	   	 	  				}
	   	 	 		    }
	   	 	      	);  	
					      		
				});
					
		}
		
	  
	  
	  function doJoinAi(){
		   if(typeof web3=='undefined'||web3.currentProvider==null){
				 fnAlert("<fmt:message key="msg.requireDappBrowse"/>");	   
	  		     return;
	  		}	
		    var account= localStorage.getItem("_account");		
		 	if(account==null||account==""){
		  		fnAlert("<fmt:message key="msg.requireDappBrowse"/>");
		  		return;
		  	} 
		 	
	
		   var msg="<fmt:message key="msg.joinAi.confirm.hint"/>"
			$("#aia").attr("disabled","disabled");
			fnConfirm(msg,function(){		   		
	 	          $.post(_g.ctxPath+"/customer/joinAi.html?decorator=blank", {"account":account},
					function(rdata){
					      if(rdata==null||rdata==""){
					    	  $("#aiImg").attr("src",_g.templatePath+"/images/checked.gif");
					    	  fnAlert("<fmt:message key="msg.joinAi.ok"/>");
					      }else{
					    	  $("#aia").removeAttr("disabled");
					    	  fnAlert(rdata);
					      }
				    }
				 );  
		   	});
			
	  }
 </script>
 
  <script>
 var websocketOrder = null;
 $(function () { 
	    if ('WebSocket' in window) {    
	    	  try{	
	    		  websocketOrder = new WebSocket(_g.orderSocketUrl);	    		
	    	}catch(e){
	    		console.log("err:"+e);
	    	}
	        //连接成功建立的回调方法
	        websocketOrder.onopen = function () {	     
	        	console.log("order connection is ok");
	        }
	        //接收到消息的回调方法
	        websocketOrder.onmessage = function (event) {	        	
	        	dappLoadUpDownOrders();	        
	        	dappGetCustomerInfo();   
	        	$("#isJoined").val(0);
	        }
	        //连接发生错误的回调方法
	        websocketOrder.onerror = function (e) {        
	        	console.log("onerror:WebSocket连接发生错误"+e);
	        };
	       //连接关闭的回调方法
	        websocketOrder.onclose = function (e) {	    	   
	        	console.log("onclose:"+e.code);	        	    	
	        }	 
	        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	        window.onbeforeunload = function () {
	        	  closeWebSocket();
	        } 
	    } else {
	        alert('当前浏览器 Not support websocket')
	    } 
 }); 
//关闭WebSocket连接
	function closeWebSocket() {
	  if(websocketOrder!=null){
		  websocketOrder.close();
	  }
		
	}

 </script>
 
<script type="text/javascript"	src="${ctxPath}/public/scripts/plugins/clipboard/clipboard.min.js"></script> 

<script src="${ctxPath}/public/scripts/plugins/jquery.spinner.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctxPath}/public/scripts/plugins/artDialog/js/dialog-min.js"></script>	  
<script type="text/javascript" src="${templatePath}/js/idangerous.js"></script>  
<!-- <script src="https://cdn.jsdelivr.net/npm/echarts@4.2.1/dist/echarts.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.18.1/min/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.18.0/dist/axios.min.js"></script> -->
<script src="${templatePath}/js/echarts.min.js"></script>   
<script src="${templatePath}/js/moment.min.js"></script>   
<script src="${templatePath}/js/axios.min.js"></script>   
<script src="${templatePath}/js/kline.js"></script>   


