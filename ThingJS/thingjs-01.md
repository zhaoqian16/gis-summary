# 场景

## 对象树

可先引入插件，创建html元素并挂载；再创建场景。

## 进出层级事件

默认进出层级事件：

campus --> building，左键双击，进入建筑，`app.on(THING.EventType.EnterLevel, ".Building", () => {})`

building --> floor，左键双击，进入楼层，`app.on(THING.EventType.LeaveLevel, ".Building", () => {})`

floor --> building，右键单击，返回建筑，`app.on(THING.EventType.EnterLevel, ".Building", () => {})`

building --> campus，右键单击，返回园区，`app.on(THING.EventType.LeaveLevel, ".Building", () => {})`



## 层级飞行回调

层级切换后飞行结束的回调函数

```javascript
app.on(THING.EventType.LevelFlyEnd, '*', (e) => {
   // e是当前选中对象 
})
```



## 自定义层级飞行

自定义进入层级的飞行方案，并暂停默认的进入层级的飞行方案。

- 所有Thing

```javascript
// 自定义
app.on(THING.EventType.EnterLevel, '.Thing', (ev) => {
    app.camera.flyTo()
}, 'customEnter')
app.pauseEvent(THING.EventType.EnterLevel, '.Thing', THING.EventTag.LevelFly)

// 卸载
app.off(THING.EventType.EnterLevel, '.Thing', 'customEnter');
app.resumeEvent(THING.EventType.EnterLevel, '.Thing', THING.EventTag.LevelFly);
```

- 单个物体

```javascript
obj.on(THING.EventType.EnterLevel, (ev) => {
    app.pauseEvent(THING.EventType.EnterLevel, '.Thing', THING.EventTag.LevelFly)
    app.camera.flyTo()
}, 'customEnter')

// 卸载
obj.off(THING.EventType.EnterLevel, '.Thing', 'customEnter');
app.resumeEvent(THING.EventType.EnterLevel, '.Thing', THING.EventTag.LevelFly);
```

## 场景显隐规则

```javascript
obj.visible = true/false
```



## 不同场景的切换

```javascript
curCampus
if (url === campusUrl[0]) {
    createCampus(campusUrl[1])
} else {
    createCampus(campusUrl[0])
}

function createCampus(url) {
    app.create({
        type: 'Campus',
        url: url,
        position:[0, 0, 0],
        visible: false,
        complete: function(ev) {
            curCampus.destory() // 删除之前的园区
            curCampus = ev.object
            curCampus.fadeIn() // 显示新园区
            app.level.change(curCampus)
        }
    })
}
```



# 地球

## 地图、场景的加载

### 创建地球

```javascript
var app = new THING.App()
THING.Utils.dynamicLoad(['https://www.thingjs.com/uearth/uearth.min.js'], function() {
    var map = app.create({
        type: 'Map',
        atmosphere: true,
        style: {
            night: true,
            fog: false
        },
        attribution: 'none'
    })
    // 添加图层
    var tileLayer = app.create({
        type: 'TileLayer',
        name: 'TileLayer',
        url: 'https://webst0{1,2,3,4}.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}',
        style: {
            brightness: 1,
            contrast: 1,
            saturation: 1,
            hue: 0,
            gamma: 1
        }
    })
    map.addLayer(tileLayer)
})
```

### 场景加载

```javascript
campus = app.create({
	type: 'Campus',
    name: '工厂',
    url: 'https://www.thingjs.com/static/models/storehouse',
    position: CAMP.Util.convertLonlatToWorld([114,35], 0.5),
    angles: CMAP.Util.getAnglesFromLonlat([114,35], 65),
    complete: function() {
        // 创建成功的回调函数
    }
})
```

### 底图切换

在地图上添加`TileLayer`后，切片图层仅需修改其`url`

```javascript
tileLayer.url = 'https://{a,b,c}.tile.openstreetmap.org/{z}/{x}/{y}.png'
```

### 底图叠加与删除

- 叠加--创建TileLayer图层，添加到地图上即可
- 删除--`map.getLayerByName`获取该图层，并移除

```javascript
// 删除图层
var layer = map.getLayerByName('gaode')[0]
map.removeLayer(layer)
```

### 底图颜色校正及滤镜

底图`TileLayer`中的`style`中有以下属性：

- `brightness`
- `contrast`
- `saturation`
- `hue`
- `gamma`
- `template`
- `customColor`

```javascript
// 颜色校正
tileLayer.style.brightness = 3

// 滤镜
tileLayer.style.template = CMAP.TileLayerStyle.DARKBLUE
tileLayer.style.template = CMAP.TileLayerStyle.CUSTOMCOLOR
tileLayer.style.customColor = [ r, g, b] // 自定义滤镜，需由hex转化为rgb格式
```



## 创建几何对象

### 创建`GeoPoint`

```javascript
// 图标--像素大小
var geoPoint = app.create({
    type: 'GeoPoint',
    name: '地铁站',
    userData: {},
    coordinates: [116, 39],
    renderer: {
        type: 'image',
        url: 'https://www.thingjs.com/static/image/train_station.png',
        size: 16 //缩放比例
    }
})

// 图标--近大远小
var geoPoint = app.create({
    type: 'GeoPoint',
    name: '地铁站',
    userData: {},
    coordinates: [116, 39],
    renderer: {
        type: 'image',
        url: 'https://www.thingjs.com/static/image/train_station.png',
        size: 500, // 缩放比例：当keepSize为false时，单位为 米
        keepSize: false // 图标近大远小
    }
})

// 矢量符号--像素大小
var geoPoint = app.create({
    type: 'GeoPoint',
    name: '国家大剧院',
    userData: { '类别': '剧院' },
    coordinates: [116.38353824615479, 39.903308600125236],
    renderer: {
        type: 'vector', // vector 代表使用内置矢量符号
        vectorType: 'circle', // 矢量符号形状 circle(圆形),triangle(三角形),rectangle(正方形),cross(十字)
        color: [255, 0, 0], // 矢量符号填充色
        opacity: 0.5, // 符号不透明度
        lineColor: [255, 255, 0], // 描边颜色
        lineOpacity: 0.8, // 描边透明度
        lineWidth: 2, // 描边宽度
        size: 10, // 缩放比例
    }
})
```



