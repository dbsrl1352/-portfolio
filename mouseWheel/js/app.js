//on이 붙으면 그게 발생했을 때 ex) on(click) (클릭)됐을 때
//load 이벤트가 뭐하는 걸까용 html 문서를 다 읽는 거
window.onload = function() {
    //(jquery) document에 이벤트 
    // $(document).on("mousemove", function(){});
    //querySelector 문서 내에서 가져오기
//    $("h1 > img").on("click", function(){
//        alert("로고 클릭");
//    });
// document.querySelector("h1 > img").addEventListener("click", function(){
//     alert("로고 클릭");
// });

$("section").on("mousemove", function(e) {
    // let x = e.pageX;
    // let y = e.pageY;
    let {pageX:x, pageY:y} = e;
   
    //첫번째 섹션
    $(".obj11").css({"bottom" :  20 + y / 30 + "px", "right" : 20 + x/30 + "px"});
    $(".obj12").css({"bottom" :  -40 - y / 30 + "px", "right" :130 - x/30 + "px"});
    $(".obj13").css({"top" : 180 +  y / 30 + "px", "right" : 60 + x/30 + "px"});
    // $(".obj11").attr("dd", 80);//속성 집어넣기 

        //두번째 섹션
        $(".obj21").css({"right":-180-(x/30), "bottom":-480-(y/30)}); 
        $(".obj22").css({"right":130+(x/50), "bottom":-40-(y/50)}); 
        //세번째 섹션 
        $(".obj31").css({"right":280-(x/30), "bottom":30-(y/30)}); 
        $(".obj32").css({"right":110+(x/20), "bottom":-270+(y/20)}); 
        $(".obj33").css({"right":-70+(x/20), "bottom":-130+(y/20)}); 
        
        //네번째 섹션 
        $(".obj41").css({"right":20-(x/30), "bottom":-120-(y/30)}); 
        $(".obj42").css({"right":0+(x/30), "bottom":-180+(y/20)});
});
    $("#menu > li").on("click",  function(e) {
        e.preventDefault(); //prevent - 예방하다 default - 기본 => 이건 기본동작을 막는 코드

        //!!!주의사항 this 제이쿼리에서 쓸 때는 함수를 화살표 함수를 쓰면 안됨
         let idx =  $(this).index(); //몇 번째 애가 클릭된건지 알려줌
         
         let h = $("section").height();
        let scrollDistance = h * idx; //몇 번째 애인지를 높이에 곱해줌

        $("html, body").stop().animate({"scrollTop": scrollDistance}, 1000);
    });

    $(window).on("scroll", function(e){
       const y = window.scrollY; 

       $("#menu > li").removeClass("on");
       
       //판별 시작해서 y값에 따라 menu > li 중에서 on이 붙어야할 녀석을 판별
       const h = $("section").height();

       if(y >= 0 && y < h){
            $("#menu > li").eq(0).addClass("on");
       } else if(y < 2 * h){
            $("#menu > li").eq(1).addClass("on");
       } else if(y < 3 * h){
        $("#menu > li").eq(2).addClass("on");
       } else if( y < 4 * h){
        $("#menu > li").eq(3).addClass("on");
       }
    });

    let scrolling = false;

    $("section").on("wheel", function(e){
        if(scrolling == true) return;

        const d = e.originalEvent.deltaY;
        const idx = $(this).index();
        const h = $("section").height();
        let result = true;
               
        if(d > 0 && idx !== 3){ //스크롤을 아래로 
            scrolling = true;
            $("html, body").stop().animate({"scrollTop": h * (idx+1)}, 1000,function(){
                //애니메이션 종료 후 실행
                scrolling = false;
            });
        } else if(d < 0 && idx !== 0) { //스크롤을 위로
            scrolling = true;
            $("html, body").stop().animate({"scrollTop": h * (idx-1)}, 1000, function(){
                //애니메이션 종료 후 실행
                scrolling = false;
            });
        }
    });
    //스크롤을 내리면서 애니메이션이 발생하는 동안에는 다시 wheel이 안 먹도록
    
} 