<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xmlns:se="http://www.opengis.net/se" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink">
  <NamedLayer>
    <se:Name>t_greenbelt_info</se:Name>
    <UserStyle>
      <se:Name>t_greenbelt_info</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>1</se:Name>
          <se:Description>
            <se:Title>1</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>green_type</ogc:PropertyName>
              <ogc:Literal>1</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#2DA556</se:SvgParameter>
			  <se:SvgParameter name="fill-opacity">0.1</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#2DA556</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
			  <se:SvgParameter name="stroke-opacity">0.8</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>2</se:Name>
          <se:Description>
            <se:Title>2</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>green_type</ogc:PropertyName>
              <ogc:Literal>2</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#BC9145</se:SvgParameter>
			  <se:SvgParameter name="fill-opacity">0.1</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#A57F2D</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
			  <se:SvgParameter name="stroke-opacity">0.8</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>3</se:Name>
          <se:Description>
            <se:Title>3</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>green_type</ogc:PropertyName>
              <ogc:Literal>3</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#BB4FBF</se:SvgParameter>
			  <se:SvgParameter name="fill-opacity">0.1</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#B155B7</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
			  <se:SvgParameter name="stroke-opacity">0.8</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>4</se:Name>
          <se:Description>
            <se:Title>4</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>green_type</ogc:PropertyName>
              <ogc:Literal>4</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#4DCFDB</se:SvgParameter>
			  <se:SvgParameter name="fill-opacity">0.1</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#27A2BC</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
			  <se:SvgParameter name="stroke-opacity">0.8</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>5</se:Name>
          <se:Description>
            <se:Title>5</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>green_type</ogc:PropertyName>
              <ogc:Literal>5</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#515FB6</se:SvgParameter>
			  <se:SvgParameter name="fill-opacity">0.1</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#5265B5</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
			  <se:SvgParameter name="stroke-opacity">0.8</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
		<se:Rule>
          <se:TextSymbolizer>
			<se:Geometry>
				<ogc:Function name="centroid">
					<ogc:PropertyName>geom</ogc:PropertyName>
				</ogc:Function>
			</se:Geometry>
            <se:Label>
              <ogc:PropertyName>name</ogc:PropertyName>
            </se:Label>
            <se:Font>
              <se:SvgParameter name="font-family">微软雅黑</se:SvgParameter>
              <se:SvgParameter name="font-size">15</se:SvgParameter>
              <se:SvgParameter name="font-weight">bold</se:SvgParameter>
            </se:Font>
            <se:LabelPlacement>
              <se:PointPlacement>
                <se:AnchorPoint>
                  <se:AnchorPointX>0.8</se:AnchorPointX>
                  <se:AnchorPointY>0.8</se:AnchorPointY>
                </se:AnchorPoint>
              </se:PointPlacement>
            </se:LabelPlacement>
            <se:Halo>
              <se:Radius>1.2</se:Radius>
              <se:Fill>
                <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                <se:SvgParameter name="fill-opacity">
                  <ogc:Function name="env">
                    <ogc:Literal>labelOpacity</ogc:Literal>
                  </ogc:Function>
                </se:SvgParameter>
              </se:Fill>
            </se:Halo>
            <se:Fill>
              <se:SvgParameter name="fill">#343942</se:SvgParameter>
              
              <se:SvgParameter name="fill-opacity">
                <ogc:Function name="env">
                  <ogc:Literal>labelOpacity</ogc:Literal>
                </ogc:Function>
              </se:SvgParameter>
            </se:Fill>
			<se:VendorOption name="spaceAround">-1</se:VendorOption>
			<se:VendorOption name="conflictResolution">False</se:VendorOption>
			<se:VendorOption name="partials">true</se:VendorOption>
          </se:TextSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
