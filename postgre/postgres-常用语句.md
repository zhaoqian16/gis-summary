# `postgres`数据库-常用语句



## postgres安装postgis插件

```
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION postgis_raster;  /*无法打开扩展控制文件 "C:/Program Files/PostgreSQL/9.6/share/extension/postgis_raster.control": No such file or directory*/
CREATE EXTENSION postgis_sfcgal;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis_tiger_geocoder;
CREATE EXTENSION address_standardizer;
```



## `postgis`-常用语句

### 矢量

```sql
--添加几何列（多面）
SELECT AddGeometryColumn ('js_sys_office_copy', 'geom', 4326, 'MULTIPOLYGON', 2);

--  设置坐标系
SELECT UpdateGeometrySRID('lzh','geom',4326);

--  获取该表坐标系
SELECT ST_SRID(geom) FROM your_table_name LIMIT 1;

-- 根据经纬度，生成空间字段
update lzh set geom = ST_GeomFromText('POINT(113.81960 34.80558)', 4610) where objid ='4109970507000222';

update your_table_name set geom = ST_SetSRID(ST_MakePoint(your_table_name.longitude, your_table_name.latitude), 4326);

update t_basic_gc set geom = ST_SetSRID(ST_MakePoint(CAST (t_basic_gc.longitude AS numeric), CAST (t_basic_gc.latitude AS numeric)), 4326);

-- 根据geojson字段，生成空间字段
update t_basic_component a set geom = ST_SetSRID(ST_GeomFromGeoJSON(a.coordinate), 4326)

-- 获取geom字段的信息
SELECT ST_AsGeoJson(geom) from t_basic_component;

SELECT ST_AsText(geom), ST_AsEwkt(geom), ST_X(geom), ST_Y(geom) FROM zyr_test WHERE id='1';

SELECT ST_AsText(geom), ST_AsEwkt(geom), ST_X(geom), ST_Y(geom) FROM lzh WHERE objid ='4109970507000222';

--将投影坐标系转换为地理坐标系，ST_Transform函数，首先需要确定该投影坐标的坐标系及WKID
update coords_tranform a set geom = ST_Transform(st_setsrid(st_makepoint(a.coord_x, a.coord_y), 2383), 4326);

-- round函数，第一个参数必须是numeric类型，第二个参数是保留几位小数
select round(1.2345,2);

-- 也可以通过 cast 函数进行转换
select round( cast ( 1 as numeric )/ cast( 4 as numeric),2);

-- 关于 cast 函数的用法
SELECT substr(CAST (1234 AS text), 3,1);

-- 查询输入坐标周边n米范围内的记录
-- st_distance()和st_distance_sphere()都可以计算两个点之间的距离，st_distance()有三个参数时查出来的距离是米，只有两个参数时，查出来的距离是度
--在高德中st_distance_sphere()比st_distance()查询出来的距离更精确
select  st_distance(ST_GeomFromText('POINT(113.787746062875 34.7887138865955)',4326),t.geom,true) closestdistance, st_asgeojson(t.geom) geo,* 
from t_basic_component t 
where ST_DWithin(ST_GeomFromText('POINT(113.787746062875 34.7887138865955)',4326)::geography,t.geom::geography,100);

select 
st_distance_sphere(ST_GeomFromText('POINT(113.787746062875 34.7887138865955)',4326),t.geom) closestdistance,
st_asgeojson(t.geom) geo,* from t_basic_component t 
where ST_DWithin(ST_GeomFromText('POINT(113.787746062875 34.7887138865955)',4326)::geography,t.geom::geography,100);

--建立默认序列
DROP SEQUENCE if EXISTS "public"."one_gid_seq";  
CREATE SEQUENCE  "public"."one_gid_seq"
 INCREMENT 1  
 MINVALUE 1  
 MAXVALUE 9223372036854775807  
 START 1  
 CACHE 1;  

```



### 栅格

```sql
-- 新建myraster数据表，可以存放栅格数据
create table myraster (
rid serial primary key,
name varchar(254),
rast raster,
minX FLOAT8,minY FLOAT8, maxX FLOAT8, maxY FLOAT8, resX FLOAT8, resY FLOAT8);

-- 获取栅格/矢量的地理范围
select ST_Extent(rast::geometry), ST_XMin(rast::geometry), ST_XMax(rast::geometry), ST_YMin(rast::geometry), ST_YMax(rast::geometry)from dem;

-- 获取栅格数据的分辨率
select ST_PixelHeight(rast), ST_PixelWidth(rast) from dem;

-- 插入myraster栅格数据表
insert into myraster (rid, rast, minX, minY, maxX, maxY, resX, resY) 
select rid, rast, ST_XMin(rast::geometry), ST_YMin(rast::geometry), ST_XMax(rast::geometry), ST_YMax(rast::geometry), ST_PixelWidth(rast), ST_PixelHeight(rast)
from dem;
update myraster set name='dem';

--创建空间索引 
CREATE INDEX dem_rast_st_convexhull_idx ON dem USING gist( ST_ConvexHull(rast) );
```



### 影像数据表

```sql
--创建影像数据表
create table sitellite_images_info
(
gid serial, --自动序号
file_name varchar(50), --影像文件名
prod_id varchar(100), --影像产品编号
sate_id varchar(100), --卫星名称
sensor_id varchar(100), --传感器名称
dataset_id varchar(50), --数据集编号
longitude float, --中心点经度
latitude float, --中心点纬度
product_date varchar(254), --产品制作日期
data_level varchar(20), --影像产品等级
geo_datum varchar(200), --影像数学基础
orbit_id varchar(100), --影像轨道号
thumbnail varchar(200), --影像缩略图
scene_id varchar(50), --影像景号
cloud varchar(10), --云量
filelist varchar(100), --影像及附带文件列表
metadata text, --xml元数据
file_path varchar(200), --影像存储路径
browse_path varchar(200), --快视图存储路径
thumbnail_path varchar(200), --缩略图存储路径
update_time varchar(254), --更新时间
user_id varchar(50) --数据上传者
)
```



## 数据库--常用语句

```sql
-- insert 语句
insert into t_basic_building(id,building_name,address,building_type,structure,layers,building_area,building_tenement,contact_man,contact_tel,longitude,latitude,person_num,house_verify_num,dept_code,unit,unit_no,district_id) 
SELECT 
id,buildingName,buildingAddress,buildingType,structure,layers,buildingArea,buildingTenement,contactMan,contactTel,longitude,latitude,personNum,houseVerifyNum,bgId,unit,unitNo,districtId FROM sjqy_building ;

```

