<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>t_basic_video</se:Name>
    <UserStyle>
      <se:Name>t_basic_video</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>001-online</se:Name>
          <se:Description>
            <se:Title>001-online</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>001</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/bsczj_on.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/bsczj_on.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>001-offline</se:Name>
          <se:Description>
            <se:Title>001-offline</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>001</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/bsczj_off.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/bsczj_off.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>002-online</se:Name>
          <se:Description>
            <se:Title>002-online</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>002</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/pacs_on.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/pacs_on.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>002-offline</se:Name>
          <se:Description>
            <se:Title>002-offline</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>002</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/pacs_off.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/pacs_off.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>003-online</se:Name>
          <se:Description>
            <se:Title>003-online</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>003</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
           <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/gd_on.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/gd_on.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>003-offline</se:Name>
          <se:Description>
            <se:Title>003-offline</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal>003</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
			<se:Graphic>
				<!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/gd_off.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/gd_off.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>online</se:Name>
          <se:Description>
            <se:Title>online</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal></ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
				<!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/online.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/online.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>offline</se:Name>
          <se:Description>
            <se:Title>offline</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>video_type</ogc:PropertyName>
                <ogc:Literal></ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>is_online</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <se:Graphic>
				<!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/offline.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/video/offline.png" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Well known marker fallback-->
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e1e289</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#232323</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>36</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
