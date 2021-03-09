      $(function() {    //화면 다 뜨면 시작
        $("#main").autocomplete({
            source : function( request, response ) {
                 $.ajax({
                        type: 'get',
                        url: "/food/custom_diet/json?food_cate3=주식&food_name="+$("#main").val(),
                        dataType: "json",
                        //data: {"param":"param"},
                        success: function(data) {
                            //서버에서 json 데이터 response 후 목록에 추가
                            response(
                                $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                    return {
                                        label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                        value: item    
                                    }
                                })
                            );
                        }
                   });
                },    // source 는 자동 완성 대상
            select : function(event, ui) {    //아이템 선택시
                console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                console.log(ui.item.label);    //김치 볶음밥label
                console.log(ui.item.value);    //김치 볶음밥
                
            },
            focus : function(event, ui) {    //포커스 가면
                return false;//한글 에러 잡기용도로 사용됨
            },
            minLength: 1,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            classes: {    //잘 모르겠음
                "ui-autocomplete": "highlight"
            },
            delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" },    //잘 모르겠음
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        });
        
    });

      $(function() {    //화면 다 뜨면 시작
          $("#soup").autocomplete({
              source : function( request, response ) {
                   $.ajax({
                          type: 'get',
                          url: "/food/custom_diet/json?food_cate3=국물&food_name="+$("#soup").val(),
                          dataType: "json",
                          //data: {"param":"param"},
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 추가
                              response(
                                  $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                      return {
                                          label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                          value: item    
                                      }
                                  })
                              );
                          }
                     });
                  },    // source 는 자동 완성 대상
              select : function(event, ui) {    //아이템 선택시
                  console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                  console.log(ui.item.label);    //김치 볶음밥label
                  console.log(ui.item.value);    //김치 볶음밥
                  
              },
              focus : function(event, ui) {    //포커스 가면
                  return false;//한글 에러 잡기용도로 사용됨
              },
              minLength: 1,// 최소 글자수
              autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
              classes: {    //잘 모르겠음
                  "ui-autocomplete": "highlight"
              },
              delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//              disabled: true, //자동완성 기능 끄기
              position: { my : "right top", at: "right bottom" },    //잘 모르겠음
              close : function(event){    //자동완성창 닫아질때 호출
                  console.log(event);
              }
          });
          
      });
      
      
      $(function() {    //화면 다 뜨면 시작
          $("#sub1").autocomplete({
              source : function( request, response ) {
                   $.ajax({
                          type: 'get',
                          url: "/food/custom_diet/json?food_cate3=반찬1&food_name="+$("#sub1").val(),
                          dataType: "json",
                          //data: {"param":"param"},
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 추가
                              response(
                                  $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                      return {
                                          label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                          value: item    
                                      }
                                  })
                              );
                          }
                     });
                  },    // source 는 자동 완성 대상
              select : function(event, ui) {    //아이템 선택시
                  console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                  console.log(ui.item.label);    //김치 볶음밥label
                  console.log(ui.item.value);    //김치 볶음밥
                  
              },
              focus : function(event, ui) {    //포커스 가면
                  return false;//한글 에러 잡기용도로 사용됨
              },
              minLength: 1,// 최소 글자수
              autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
              classes: {    //잘 모르겠음
                  "ui-autocomplete": "highlight"
              },
              delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//              disabled: true, //자동완성 기능 끄기
              position: { my : "right top", at: "right bottom" },    //잘 모르겠음
              close : function(event){    //자동완성창 닫아질때 호출
                  console.log(event);
              }
          });
          
      });
      
      $(function() {    //화면 다 뜨면 시작
          $("#sub2").autocomplete({
              source : function( request, response ) {
                   $.ajax({
                          type: 'get',
                          url: "/food/custom_diet/json?food_cate3=반찬2&food_name="+$("#sub2").val(),
                          dataType: "json",
                          //data: {"param":"param"},
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 추가
                              response(
                                  $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                      return {
                                          label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                          value: item    
                                      }
                                  })
                              );
                          }
                     });
                  },    // source 는 자동 완성 대상
              select : function(event, ui) {    //아이템 선택시
                  console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                  console.log(ui.item.label);    //김치 볶음밥label
                  console.log(ui.item.value);    //김치 볶음밥
                  
              },
              focus : function(event, ui) {    //포커스 가면
                  return false;//한글 에러 잡기용도로 사용됨
              },
              minLength: 1,// 최소 글자수
              autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
              classes: {    //잘 모르겠음
                  "ui-autocomplete": "highlight"
              },
              delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//              disabled: true, //자동완성 기능 끄기
              position: { my : "right top", at: "right bottom" },    //잘 모르겠음
              close : function(event){    //자동완성창 닫아질때 호출
                  console.log(event);
              }
          });
          
      });
      
      $(function() {    //화면 다 뜨면 시작
          $("#sub3").autocomplete({
              source : function( request, response ) {
                   $.ajax({
                          type: 'get',
                          url: "/food/custom_diet/json?food_cate3=반찬3&food_name="+$("#sub3").val(),
                          dataType: "json",
                          //data: {"param":"param"},
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 추가
                              response(
                                  $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                      return {
                                          label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                          value: item    
                                      }
                                  })
                              );
                          }
                     });
                  },    // source 는 자동 완성 대상
              select : function(event, ui) {    //아이템 선택시
                  console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                  console.log(ui.item.label);    //김치 볶음밥label
                  console.log(ui.item.value);    //김치 볶음밥
                  
              },
              focus : function(event, ui) {    //포커스 가면
                  return false;//한글 에러 잡기용도로 사용됨
              },
              minLength: 1,// 최소 글자수
              autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
              classes: {    //잘 모르겠음
                  "ui-autocomplete": "highlight"
              },
              delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//              disabled: true, //자동완성 기능 끄기
              position: { my : "right top", at: "right bottom" },    //잘 모르겠음
              close : function(event){    //자동완성창 닫아질때 호출
                  console.log(event);
              }
          });
          
      });
      
      $(function() {    //화면 다 뜨면 시작
          $("#sub4").autocomplete({
              source : function( request, response ) {
                   $.ajax({
                          type: 'get',
                          url: "/food/custom_diet/json?food_cate3=부식&food_name="+$("#sub4").val(),
                          dataType: "json",
                          //data: {"param":"param"},
                          success: function(data) {
                              //서버에서 json 데이터 response 후 목록에 추가
                              response(
                                  $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                                      return {
                                          label: item,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                          value: item    
                                      }
                                  })
                              );
                          }
                     });
                  },    // source 는 자동 완성 대상
              select : function(event, ui) {    //아이템 선택시
                  console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
                  console.log(ui.item.label);    //김치 볶음밥label
                  console.log(ui.item.value);    //김치 볶음밥
                  
              },
              focus : function(event, ui) {    //포커스 가면
                  return false;//한글 에러 잡기용도로 사용됨
              },
              minLength: 1,// 최소 글자수
              autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
              classes: {    //잘 모르겠음
                  "ui-autocomplete": "highlight"
              },
              delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//              disabled: true, //자동완성 기능 끄기
              position: { my : "right top", at: "right bottom" },    //잘 모르겠음
              close : function(event){    //자동완성창 닫아질때 호출
                  console.log(event);
              }
          });
          
      });