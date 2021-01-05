function getCovidData(){
    //여기서 뭔가 시간이 걸리는 작업이 이뤄지는 거야(비동기)
    return new Promise((resolve, reject) => {
        setTimeout(()=>{
            resolve("hello world");
        },3000);
    });

}

//x에 resolve("hello world");
getCovidData().then(x => {
    console.log(x);
})
