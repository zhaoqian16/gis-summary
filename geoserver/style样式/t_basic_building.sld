<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>t_basic_building</se:Name>
    <UserStyle>
      <se:Name>t_basic_building</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>Single symbol</se:Name>
		  <se:PointSymbolizer>
            <se:Graphic>
              <!--Parametric PNG-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/building/ld.png?fill=%23e1e289&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
                <se:Format>image/png</se:Format>
              </se:ExternalGraphic>
              <!--Plain PNG fallback, no parameters-->
              <se:ExternalGraphic>
                <se:OnlineResource xlink:href="http://cgpt.erqi.gov.cn:8080/resources/svg/building/ld.png" xlink:type="simple"/>
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
              <se:Size>24</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
