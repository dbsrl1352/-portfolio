String.prototype.zero = function(){
    return this.substring(this.length - 2);
}

window.onload = function(){
    const h = $(".h"); //각 시,분 초를 나타내는 dom을 가져온다. 가져온 돔은 제이쿼리 객체다.
    const m = $(".m");
    const s = $(".s");

    let timeLabel = [h, m, s];
    let ispause = true; 

        $("#start").on("click", e => {
            document.querySelector("#start").innerHTML = "중지";
                let time = h.text() * 3600 + m.text() * 60 + s.text() * 1;

                let ho = $(".h").text();
                let mi = $(".m").text();
                let se = $(".s").text();
    
                document.querySelector(".total").innerHTML = `${ho} : ${mi} : ${se} `;
                
                let timerId = setInterval(()=>{
                    time--;
        
                    let hour = "00" + Math.floor(time / 3600); //시간을 구한다.
                    let min = "00" + Math.floor((time - hour * 3600) / 60); //분을 구한다.
                    let sec = "00" + time % 60;
        
                    h.text(hour.zero());
                    m.text(min.zero());
                    s.text(sec.zero());
                    //자릿수가 한자리 일때도 앞에 0이 붙어서 나오도록 변경해라.
                    if(time <= 0 || ispause == false){
                        clearInterval(timerId); //시간이 0이되면 타이머를 멈춘다.
                        document.querySelector("#start").innerHTML = "시작";
                    }
                }, 1000);
        
           $("#start").on("click", e => {
            document.querySelector("#start").innerHTML = "시작";
            ispause = false;
            console.log(ispause);
           });
        });
    const spins = $(".spin"); //3개의 스핀을 가져온다.
    let ends = [23, 59, 59];
    for(let i = 0; i < 3; i++){
        fillNumber(spins.eq(i), ends[i]);
    }


    function fillNumber(target, endNumber){
        target.empty(); //타겟내에 있는거 지우고
        target.append(`<div class="block">--</div><div class="block">--</div>`);
        for(let i = 0; i <= endNumber; i++){
            target.append(`<div class="block">${ (i + "").zero() }</div>`);
        }
        target.append(`<div class="block">--</div><div class="block">--</div>`);
    }

    let isDrag = false;
    let target = undefined;
    let startY = undefined;
    
    let max = [-920, -2320, -2320];
    $(".spin").on("mousedown", e => {
        isDrag = true;
        target = e.currentTarget;
        startY = e.pageY;
    });
    $(".spin").on("mousemove", function(e) {
        if(!isDrag) return;

        let delta = (startY - e.pageY) / 10;

        let top = parseInt( $(target).css("top") );
        top -= delta;
        if(top > 0) top = 0;
        if(top < max[$(this).index()]) top = max[$(this).index()];
        
        $(target).css({top: `${top}px`});
        start = e.offsetY;
    });
    $("#popup").on("mouseup", e => {
        isDrag = false;
        let top = parseInt( $(target).css("top") );
        top = Math.floor(top /40 ) * 40;
        $(target).stop().animate({top: `${top}px`}, 300);
    });

    $("#saveBtn").on("click", e => {
        $(".spin").each( (idx, item) => {
            let top = parseInt($(item).css("top"));
            top = Math.abs(top / 40); 
            timeLabel[idx].html( ("00" + top ).zero()  );
        });
        $("#popup").fadeOut(500);
    });
}

//1. 시작을 누르면 중지버튼으로 시작버튼이 변경되고 중지버튼을 누르면 타이머가 중지된다.
//2. 밑에 있는 라벨의 시간도 선택된 시간으로 같이 변경된다.
//나머지 기능반 사람들은 완성된 알람 앱을 제출하면 된다. 
