# geoserver-其它

style样式中：不能使用gid字段（主键字段，加载图层字段时也是没有的）



## filter使用

- 添加了filter的sld文件

```shell
<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ogc="http://www.opengis.net/ogc" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>quhua</se:Name>
    <UserStyle>
      <se:Name>quhua</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>office_cod</ogc:PropertyName>
              <ogc:Function name="env">
                <ogc:Literal>mouse_code</ogc:Literal>
              </ogc:Function>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f4d1d5</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.6</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#f47987</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">1</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsNotEqualTo>
              <ogc:PropertyName>office_cod</ogc:PropertyName>
              <ogc:Function name="env">
                <ogc:Literal>mouse_code</ogc:Literal>
              </ogc:Function>
            </ogc:PropertyIsNotEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f4d1d5</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.6</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#232323</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">1</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
```

- 服务请求时引用：

http://localhost:8081/geoserver/districts/wms?service=WMS&version=1.1.0&request=GetMap&layers=districts%3Aquhua&bbox=113.520329035518%2C34.612088478079%2C113.94147014957%2C34.8970516408347&width=768&height=519&srs=EPSG%3A4326&format=application/openlayers**&env=mouse_code:410104**



## 获取wms图层的要素（AMap）

### GetFeature方式获取

```javascript
let _this = this
this.aViewer.on('mousemove', function (e) {
    let lnglat = e.lnglat
    // 如果是要获取点的属性，需要设置容差
    let filter = '<Filter xmlns="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">' + 
                 '<Intersects><PropertyName>geom</PropertyName><gml:Point>' + 
                 `<gml:coordinates>${lnglat.getLng()},${lnglat.getLat()}</gml:coordinates></gml:Point></Intersects></Filter>`
                 
    _this.$get('http://test.hnzwdz.com/geoserver/districts/ows', {
      service: 'WFS',
      version: '1.0.0',
      srs: 'EPSG:4326',
      request: 'GetFeature',
      typeName: 'districts:quhua',  // 要素类型列表
      outputFormat: 'application/json',
      maxFeatures: 1,
      filter: filter
    }).then(res => {
      if (!res.features[0]) return
      let office_code = res.features[0].properties['office_code']
      // 找到该图层
      let layers = _this.aViewer.getLayers()
      let layer = layers.filter(layer => layer.title==='districts:quhua')[0]
      layer.setParams({
        env: `mouse_code:${office_code}`
      })
    })
})
```



### GetFeatureInfo方式获取

```javascript
let _this = this
this.aViewer.on('mousemove', function (e) {
    let lnglat = e.lnglat
    let pixel = _this.aViewer.lngLatToContainer(lnglat)
    let pixel_sw = new AMap.Pixel(pixel.x - 12, pixel.y - 12)
    let pixel_ne = new AMap.Pixel(pixel.x + 12, pixel.y + 12)
    let bbox_sw = _this.aViewer.containerToLngLat(pixel_sw)
    let bbox_ne = _this.aViewer.containerToLngLat(pixel_ne)
    let bbox = `${bbox_sw.Q}, ${bbox_ne.P}, ${bbox_ne.Q}, ${bbox_sw.P}`
    _this.$get('http://test.hnzwdz.com/geoserver/districts/wms', {
      SERVICE: 'WMS',
      SRS: 'EPSG:4326',
      LAYERS: 'districts:quhua',
      QUERY_LAYERS: 'districts:quhua',
      TRANSPARENT: 'true',
      VERSION: '1.1.0',
      EXCEPTIONS: 'application/json',
      INFO_FORMAT: 'application/json',
      REQUEST: 'GetFeatureInfo',
      FEATURE_COUNT: '1',
      X: '5',
      Y: '5',
      WIDTH: '10',
      HEIGHT: '10',
      bbox: bbox,
    }).then(res => {
      if (!res.features[0]) return
      let office_code = res.features[0].properties['office_code']
      // 找到该图层
      let layers = _this.aViewer.getLayers()
      let layer = layers.filter(layer => layer.title==='districts:quhua')[0]
      layer.setParams({
        env: `mouse_code:${office_code}`
      })
    })
})
```

