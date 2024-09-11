const OrangeGreen = ['rgba(131, 223, 109, 0.8)', 'rgba(255, 140, 64, 0.8)'];
const YellowGreenRed = ['rgba(239, 23, 23, 1)', 'rgba(131, 223, 109, 1)', 'rgba(239, 196, 23, 1)'];
const BlueYellow = ['rgba(71, 217, 255, 0.8)', 'rgba(236, 218, 66, 0.8)'];
const BlueGreenRedYellow = ['rgba(81, 188, 222, 0.8)', 'rgba(118, 212, 102, 0.8)', 'rgba(239, 80, 77, 0.8)', 'rgba(236, 218, 66, 0.8)'];
const PurpleGradient = ['rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161, 138, 214, 255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)', 'rgba(161,138,214,255)'];
const OrangeGradient = ['rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)', 'rgba(255,173,94,255)'];

function ApplyDoughnutChart(XAxis = null, YAxis = null, ChartId, titles, totCount, type, shades) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray = XAxis.split('-');
    const YAxisArray = YAxis.split('-');

    const ctx = document.getElementById(ChartId).getContext('2d');

    const myChart = new Chart(ctx, {
        type: type,
        options: {
            title: {
                display: true,
                text: titles + ' (' + totCount + ')'

            }
        },
        data: {

            labels: [XAxisArray[0] + ' (' + YAxisArray[0] + ') ', XAxisArray[1] + ' (' + YAxisArray[1] + ') '],
            datasets: [{
                data: [YAxisArray[0], YAxisArray[1]],
                backgroundColor: Color[shades],
                hoverOffset: 4
            }]
        }

    });
}

function ApplyDoughnutCharts(XAxis = null, YAxis = null, ChartId, titles, totCount, type, shades) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray = XAxis.split('-');
    const YAxisArray = YAxis.split('-');

    const ctx = document.getElementById(ChartId).getContext('2d');

    const myChart = new Chart(ctx, {
        type: type,
        options: {
            title: {
                display: true,
                text: titles + ' (' + totCount + ')'

            }
        },
        data: {

            labels: [XAxisArray[0] + ' (' + YAxisArray[0] + ') ', XAxisArray[1] + ' (' + YAxisArray[1] + ') ', XAxisArray[2] + ' (' + YAxisArray[2] + ') '],
            datasets: [{
                data: [YAxisArray[0], YAxisArray[1], YAxisArray[2]],
                backgroundColor: Color[shades],
                hoverOffset: 4
            }]
        }

    });
}

function ApplyBarChart(XAxis = null, YAxis = null, ChartId, titles, totCount, type, shades) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray = XAxis.split('-');
    const YAxisArray = YAxis.split('-');

    const ctx = document.getElementById(ChartId).getContext('2d');

    const myChart = new Chart(ctx, {
        type: type,
        options: {
            title: {
                display: true,
                text: titles

            },
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            legend: {
                display: false
            }
        },
        data: {

            labels: [XAxisArray[0] + ' (' + YAxisArray[0] + ') ', XAxisArray[1] + ' (' + YAxisArray[1] + ') '],
            datasets: [{
                data: [YAxisArray[0], YAxisArray[1]],
                label: '',
                backgroundColor: Color[shades],
                borderColor: ['rgba(131, 223, 109, 1)', 'rgba(255, 140, 64, 1)'],
                borderWidth: 1
            }]
        }

    });
}

function ApplyBarCharts(XAxis = null, YAxis = null, ChartId, titles, totCount, type, shades) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray = XAxis.split('-');
    const YAxisArray = YAxis.split('-');

    const ctx = document.getElementById(ChartId).getContext('2d');

    const myChart = new Chart(ctx, {
        type: type,
        options: {
            title: {
                display: true,
                text: titles + ' (' + totCount + ')'

            },
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            legend: {
                display: true
            }
        },
        data: {

            labels: [XAxisArray[0] + ' (' + YAxisArray[0] + ') ', XAxisArray[1] + ' (' + YAxisArray[1] + ') ', XAxisArray[2] + ' (' + YAxisArray[2] + ') ', XAxisArray[3] + ' (' + YAxisArray[3] + ') '],
            datasets: [{
                data: [YAxisArray[0], YAxisArray[1], YAxisArray[2], YAxisArray[3]],
                label: '',
                backgroundColor: Color[shades],
                borderColor: ['rgba(81, 188, 222, 1)', 'rgba(118, 212, 102, 1)', 'rgba(239, 80, 77, 1)', 'rgba(236, 218, 66, 1)'],
                borderWidth: 1
            }]
        }

    });
}

function ApplyVertBarChartSellingItem(XAxis , YAxis, Name) {

    
    const XAxisArray1 = XAxis.split('{0}');
    const YAxisArray1 = YAxis.split('-');
    const topSellingItem = Name.split('{0}');

    const ctx1 = document.getElementById('TopSellingItem');

    const myChart1 = new Chart(ctx1, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray1[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${topSellingItem[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray1,
            datasets: [{
                axis: 'y',
                data: YAxisArray1,
                legendText: '',
                label: 'Item Quantity',
                fill: false,
                backgroundColor: PurpleGradient,
                borderColor: PurpleGradient,
                borderWidth: 1
            }]
        }
    });
}

function ApplyVertBarChartSellingSubCat(XAxis, YAxis, Name) {


    const XAxisArray2 = XAxis.split('-');
    const YAxisArray2 = YAxis.split('-');
    const topSellingSubCat = Name.split('{0}');

    const ctx2 = document.getElementById('TopSellingSubCat');

    const myChart2 = new Chart(ctx2, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray2[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${topSellingSubCat[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray2,
            datasets: [{
                axis: 'y',
                data: YAxisArray2,
                legendText: '',
                label: 'Sub Category Quantity',
                fill: false,
                backgroundColor: PurpleGradient,
                borderColor: PurpleGradient,
                borderWidth: 1
            }]
        }
    });
}

function ApplyVertBarChartSellingCategory(XAxis, YAxis, Name) {


    const XAxisArray3 = XAxis.split('-');
    const YAxisArray3 = YAxis.split('-');
    const topSellingCategory = Name.split('{0}');

    const ctx3 = document.getElementById('TopSellingCategory');

    const myChart3 = new Chart(ctx3, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray3[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${topSellingCategory[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray3,
            datasets: [{
                axis: 'y',
                data: YAxisArray3,
                legendText: '',
                label: 'Category Quantity',
                fill: false,
                backgroundColor: PurpleGradient,
                borderColor: PurpleGradient,
                borderWidth: 1
            }]
        }
    });
}

function ApplyVertBarChartPopularRoute(XAxis, YAxis, Name) {


    const XAxisArray4 = XAxis.split('{0}');
    const YAxisArray4 = YAxis.split('-');
    const popularRoute = Name.split('{0}');

    const ctx4 = document.getElementById('MostPerformingRoute');

    const myChart4 = new Chart(ctx4, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray4[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${popularRoute[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray4,
            datasets: [{
                axis: 'y',
                data: YAxisArray4,
                legendText: '',
                label: 'Route Count',
                fill: false,
                backgroundColor: OrangeGradient,
                borderColor: OrangeGradient,
                borderWidth: 1
            }]
        }
    });
}

function ApplyVertBarChartPopularCustomer(XAxis, YAxis, Name) {


    const XAxisArray5 = XAxis.split('-');
    const YAxisArray5 = YAxis.split('-');
    const popularCustomer = Name.split('{0}');

    const ctx5 = document.getElementById('MostPerformingCustomer');

    const myChart5 = new Chart(ctx5, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray5[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${popularCustomer[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            indexAxis: 'y',
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray5,
            datasets: [{
                axis: 'y',
                data: YAxisArray5,
                legendText: '',
                label: 'Customer Count',
                fill: false,
                backgroundColor: OrangeGradient,
                borderColor: OrangeGradient,
                borderWidth: 1
            }]
        }
    });
}

function ApplyHorrBarChartGoodReturned(XAxis, YAxis, Name) {

    const GreenBubble = ['rgba(180,233,205,255)'];
    
    const XAxisArray6 = XAxis.split('-');
    const YAxisArray6 = YAxis.split('-');
    const goodReturn = Name.split('{0}');
    
    const ctx6 = document.getElementById('FrequentlyGoodReturned');
    const myChart6 = new Chart(ctx6, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray6[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${goodReturn[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray6,
            datasets: [{
                data: YAxisArray6,
                legendText: '',
                label: 'Good Return',
                fill: false,
                backgroundColor: GreenBubble,
                borderColor: GreenBubble,
                borderWidth: 1
            }]
        }
    });
}

function ApplyHorrBarChartBadReturned(XAxis, YAxis, Name) {

    const RedBubble = ['rgba(249,183,197,255)'];

    const XAxisArray8 = XAxis.split('-');
    const YAxisArray8 = YAxis.split('-');
    const badReturn = Name.split('{0}');

    const ctx8 = document.getElementById('FrequentlyBadReturned');
    const myChart8 = new Chart(ctx8, {
        type: 'bar',
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function (context) {
                            return `Code : ${XAxisArray8[context[0].dataIndex]}`;
                        },
                        afterTitle: function (context) {
                            return `Name : ${badReturn[context[0].dataIndex]}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        },
        data: {

            labels: XAxisArray8,
            datasets: [{
                data: YAxisArray8,
                legendText: '',
                label: 'Bad Return',
                fill: false,
                backgroundColor: RedBubble,
                borderColor: RedBubble,
                borderWidth: 1
            }]
        }
    });
}

function ApplyTrippleBarChart(XAxis, YAxis) {
    const BlueBar = ['rgba(91,166,255,255)'];
    const GreenBar = ['rgba(106,212,155,255)'];
    const RedBar = ['rgba(243,93,130,255)'];

    const XAxisArray7 = XAxis.split('-');
    const YAxisArray7 = YAxis.split('-');
    
    const labels = XAxisArray7;
    const data = {
        labels: labels,
        datasets: [
            {
                label: 'Orders',
                data: YAxisArray7,
                borderColor: BlueBar,
                backgroundColor: BlueBar,
            }
        ]
    };
    
    const ctx7 = document.getElementById('MonthlySales');
    const myChart7 = new Chart(ctx7, {
        type: 'bar',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    });
}

function ApplyPlannedDoughnutChart(XAxis, YAxis) {
    
    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray9 = XAxis.split('-');
    const YAxisArray9 = YAxis.split('-');

    const ctx9 = document.getElementById('CusTotalVisits').getContext('2d');

    const myChart9 = new Chart(ctx9, {
        type: 'doughnut',
        options: {
            
        },
        data: {

            labels: [XAxisArray9[0] + ' (' + YAxisArray9[0] + ') ', XAxisArray9[1] + ' (' + YAxisArray9[1] + ') '],
            datasets: [{
                data: [YAxisArray9[0], YAxisArray9[1]],
                backgroundColor: OrangeGreen,
                hoverOffset: 4
            }]
        }

    });
}

function ApplyActualDoughnutChart(XAxis, YAxis) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray10 = XAxis.split('-');
    const YAxisArray10 = YAxis.split('-');

    const ctx10 = document.getElementById('CusTotalSchedule').getContext('2d');

    const myChart10 = new Chart(ctx10, {
        type: 'doughnut',
        options: {

        },
        data: {

            labels: [XAxisArray10[0] + ' (' + YAxisArray10[0] + ') ', XAxisArray10[1] + ' (' + YAxisArray10[1] + ') '],
            datasets: [{
                data: [YAxisArray10[0], YAxisArray10[1]],
                backgroundColor: OrangeGreen,
                hoverOffset: 4
            }]
        }

    });
}

function ApplyLoadsDoughnutChart(XAxis, YAxis) {

    const Color = [OrangeGreen, YellowGreenRed, BlueYellow, BlueGreenRedYellow]

    const XAxisArray11 = XAxis.split('-');
    const YAxisArray11 = YAxis.split('-');

    const ctx11 = document.getElementById('LoadRprts').getContext('2d');

    const myChart11 = new Chart(ctx11, {
        type: 'doughnut',
        options: {

        },
        data: {

            labels: '',
            datasets: [{
                data: [YAxisArray11[0], YAxisArray11[1], YAxisArray11[2]],
                backgroundColor: YellowGreenRed,
                hoverOffset: 4
            }]
        }

    });
}

function ApplyMonthlyTargetChart(XAxis, YAxis, ZAxis) {

    const XAxisArray12 = XAxis.split('-');
    const YAxisArray12 = YAxis.split('-');
    const ZAxisArray12 = ZAxis.split('-');

    const ctx12 = document.getElementById('TargetAcheivedMonthly');
    const myChart12 = new Chart(ctx12, {
        type: 'scatter',
        data: {
            labels: XAxisArray12,
            datasets: [{
                type: 'bar',
                label: 'Target',
                data: YAxisArray12,
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgba(255, 99, 132, 0.2)'
            }, {
                type: 'line',
                label: 'Achieved',
                data: ZAxisArray12,
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function ApplyDailyTargetChart(XAxis, YAxis, ZAxis) {

    const XAxisArray13 = XAxis.split('-');
    const YAxisArray13 = YAxis.split('-');
    const ZAxisArray13 = ZAxis.split('-');

    const ctx13 = document.getElementById('TargetAcheivedDaily');
    const myChart13 = new Chart(ctx13, {
        type: 'scatter',
        data: {
            labels: XAxisArray13,
            datasets: [{
                type: 'bar',
                label: 'Target',
                data: YAxisArray13,
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgba(255, 99, 132, 0.2)'
            }, {
                type: 'line',
                label: 'Achieved',
                data: ZAxisArray13,
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}





