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
	//해당일에 해당하는 데이터는 시/분/초 , 전날 등록 데이터 년/월/일 현재 시간 기준으로 화면 내용 달라지도록 함수 작성후 사용
	function displayTime(timeValue){
		
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str ="";
		
		if(gap < (1000 * 60 * 60 * 24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
		} else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1; // getMonth() is zero based +1
			var dd = dateObj.getDate();
			
			
			return [ yy, '/', (mm > 9 ? '' : '0')+ mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
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