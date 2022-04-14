/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const getOrders = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/orders/all`, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                                    headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(`json`, json)
    const jsonASC = json.data.sort((a, b) => new Date(a.createdAt) - new Date(b.createdAt))
    lineChart(jsonASC)
}

getOrders()

const lineChart = (json) => {
    var xValues = json.map(x => {
        const date = new Date(x.createdAt)
        return `${date.getDay()}-${date.getMonth()}-${date.getFullYear()}`
    });
    var yValues = json.map(x => x.priceThisTime);
    console.log(xValues, yValues)
    new Chart("lineChart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                    fill: false,
                    lineTension: 0,
                    backgroundColor: "rgba(0,0,255,1.0)",
                    borderColor: "rgba(0,0,255,0.1)",
                    data: yValues
                }]
        },
        options: {
            legend: {display: false},
        }
    });
}




