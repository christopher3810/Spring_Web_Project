console.log("Reply Module......");

var replyService = (function(){
	
	function add(reply, callback, error){
		console.log("add reply...............");
		
		$.ajax({
				type : 'post',
				url : '/replies/new',
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",//json 으로 전송
				success : function(result, status, xhr){
					if(callback){ 
						callback(result);
					}
				}, //callback 과 error를 함수로 받음 호출 성공후 특정 값이 존재시와 아닐시 js는 파라미터 개수를 일치시킬 필요가 없음 
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}		
		})
	}
	
	function getList(param, callback, error){
		
		var bno = param.bno;
		var page = param.page || 1;
		//jquery getJson()사용 /  param 객체 통해 파라미터 전달받아 json목록 호출 형태가 json이여야 함으로 url 끝에 .json 필요합니다
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				function(data){
					if (callback) {
						//callback(data); 목록 소환
						callback(data.replyCnt, data.list); //카운트한것까지 포함
					}
				}).fail(function(xhr, status, err){
					if (error){
						error();
					}
				});
		}
	
	//remove는 DELETE 방식으로 데이터 전달해서 ajax이용해서 구체적으로 type 속성으로 delete  지정해야됨  
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	// 수정내용 + 댓글번호 전송 json사용
	function update(reply, callback, error){
		
			console.log("RNO: " + reply.rno);
			
			$.ajax({
				type : 'put',
				url : '/replies/' + reply.rno,
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8" ,
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
	
	function get(rno, callback, error){
		
		$.get("/replies/" + rno + ".json", function(result){
			
			if(callback){	
				callback(result);
			}
			
		}).fail(function(xhr, status, err){
			
			if(error){
				error();
			}
		});
	}
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	//해당일에 해당하는 데이터는 시/분/초 , 전날 등록 데이터 년/월/일 현재 시간 기준으로 화면 내용 달라지도록 함수 작성후 사용
	function displayTime(timeValue){
		
		console.log("displaytime 넘어온 reply timeValue check : " + timeValue)
		var timevaluetemp = new Date(timeValue);
		console.log("displaytime 넘어온 reply timeValueNewDate check : " + timevaluetemp)
		timevaluetemp = getFormatDate(timevaluetemp)
		console.log("displaytime 넘어온 reply timeValuefinal check : " + timevaluetemp)
		
		return timevaluetemp;
	}
	;
	
	return {
		add : add ,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();