# mapv.js
* [mapv.js官方网站](https://mapv.baidu.com/)
## mapv.js是作用于百度地图上的一个插件，给百度地图加图层，实现动态效果

## 需求，覆盖百度地图，绘出微服务A点到B点流量的动态变化
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>my map app</title>
    <style type="text/css">
        #mymap
        {
            width: 1200px;
            height: 500px;
        }
        #div1
        {
            width: 1200px;
            height: 400px;
            overflow: hidden;
            background: ;
        }
    </style>
</head>
<body>
<div id='div1'>
    <div id="mymap"></div>
</div>
</body>
<script src="https://api.map.baidu.com/api?v=2.0&ak=xa4iyslV4DxY4bUXXpTWhf1P9uEtRiLp">
</script>
<script src="http://mapv.baidu.com/build/mapv.min.js"></script>
<script>
    let map=new BMap.Map('mymap',{enableMapClick:false});
    let mapCenter="武汉市";
    let locationCenter= mapv.utilCityCenter.getCenterByCityName(mapCenter);
    map.centerAndZoom(new BMap.Point(locationCenter.lng, locationCenter.lat), 5);
    //map.setZoom(5);   
    map.setMapStyle({
        styleJson: [{
            "featureType": "all",
            "elementType": "all",
            "stylers": {"visibility": "off"}
        }]
    });
    
    function drawPointData(map)
    {
        let pointData = [];
        let fromCenter = mapv.utilCityCenter.getCenterByCityName('广东市');
        let toCenter = mapv.utilCityCenter.getCenterByCityName('北京市');
        pointData.push({
            geometry: {
                type: 'Point',
                coordinates: [fromCenter.lng, fromCenter.lat]
            }
        });
        pointData.push({
            geometry: {
                type: 'Point',
                coordinates: [toCenter.lng, toCenter.lat]
            }
        });
        let pointOptions = {
            fillStyle: 'rgba(254,175,3,0.7)',
            shadowColor: 'rgba(55, 50, 250, 0.5)',
            shadowBlur: 10,
            size: 5,
            zIndex: 10,
            draw: 'simple'
        }    
        let pointDataSet = new mapv.DataSet(pointData);
        let pointLayer = new mapv.baiduMapLayer(map, pointDataSet, pointOptions);
    }
    function drawLineData(map)
    {
        let lineData = [];
        let fromCenter = mapv.utilCityCenter.getCenterByCityName('广东市');
        let toCenter = mapv.utilCityCenter.getCenterByCityName('北京市');
        let curve = mapv.utilCurve.getPoints([fromCenter, toCenter]);
        lineData.push({
            geometry: {
                type: 'LineString',
                coordinates: curve
                //coordinates: [[fromCenter.lng, fromCenter.lat], [toCenter.lng, toCenter.lat]]
            },
            count: 30 * Math.random()
        });
        let lineDataSet = new mapv.DataSet(lineData);
        let lineOptions = {
            strokeStyle: 'rgba(255, 250, 50, 0.8)',
            shadowColor: 'rgba(255, 250, 50, 1)',
            shadowBlur: 20,
            lineWidth: 2,
            zIndex: 100,
            draw: 'simple'
        }
        let lineLayer = new mapv.baiduMapLayer(map, lineDataSet, lineOptions);
    }
    function drawTimeData(map)
    {
        let timeData = [];
        let fromCenter = mapv.utilCityCenter.getCenterByCityName('广东市');
        let toCenter = mapv.utilCityCenter.getCenterByCityName('北京市');

        let curve = mapv.utilCurve.getPoints([fromCenter, toCenter]);

        for (j = 0; j < curve.length; j++) 
        {
            timeData.push({
                geometry: {
                    type: 'Point',
                    coordinates: curve[j]
                },
                count: 1,
                time: j
            });
        }

        let timeDataSet = new mapv.DataSet(timeData);
        let timeOptions = {
                fillStyle: 'red',
                zIndex: 200,
                size: 2.5,
                animation: {
                    type: 'time',
                    stepsRange: {
                        start: 0,
                        end: 50
                    },
                    trails: 10,
                    duration: 2,
                },
                draw: 'simple'
            }

        let timeMapvLayer = new mapv.baiduMapLayer(map, timeDataSet, timeOptions);
    }
    function drawTextData(map)
    {
        let textData = [];
        let fromCenter = mapv.utilCityCenter.getCenterByCityName('广东市');
        let toCenter = mapv.utilCityCenter.getCenterByCityName('北京市');
        textData.push({
            geometry: {
                type: 'Point',
                coordinates: [fromCenter.lng, fromCenter.lat]
            },
                text: 'A'
        });
        textData.push({
            geometry: {
                type: 'Point',
                coordinates: [toCenter.lng, toCenter.lat]
            },
            text: "B"
        });
        let textDataSet = new mapv.DataSet(textData);
        let textOptions = {
            draw: 'text',
            font: '14px Arial',
            fillStyle: 'black',
            shadowColor: 'white',
            shadowBlue: 10,
            zIndex: 11,
            size:20,
            shadowBlur: 2
        }
        let textMapvLayer = new mapv.baiduMapLayer(map, textDataSet, textOptions);
    }
    drawPointData(map);
    drawLineData(map);
    drawTimeData(map);
    drawTextData(map);
</script>
</html>
```
