# postgres 导入数据



## postgres 导入矢量数据

### 命令行

```shell
shp2pgsql -s 坐标系 -c -W 编码方式 文件名 命名空间.表名 | psql位置 -h 服务器 -U 用户名 -d 数据库 -p 端口号
shp2pgsql -s 4326 -c -W UTF-8 E:\data\postgis_import_records\component_wgs1984.shp public.test_points | C:\"Program Files"\PostgreSQL\9.6\bin\psql -h localhost -U postgres -d postgres -p 5432
-s 4326 坐标系
-c 创建新表
-W UTF-8 定义字符编码方式
E:\data\postgis_import_records\component_wgs1984.shp public.test_points 文件名 命名空间.表名
C:\"Program Files"\PostgreSQL\9.6\bin\psql psql位置
-h 服务器地址
-U 账户ID
-d 数据库名称
-p 端口号
```

### 参数含义

| 参数               | 描述                                                         |
| ------------------ | ------------------------------------------------------------ |
| -s<srid>           | 设置数据的坐标，比如4326                                     |
| -d\|a\|c\|p        | -d 删除原表并重新创建;-a 追加shp数据到当前表后;-c 创建一个新表，默认该模式;-p 准备模式，仅仅创建表 |
| -g <geocolumn>     | 定义geometry列的名称                                         |
| -D                 | 使用dump格式                                                 |
| -e                 | 单独执行每个语句，不要使用事务。与-D不兼容                   |
| -G                 | 使用地理类型（需要lon/lat数据或-s重新投影）                  |
| -k                 | 保留postgresql标识符                                         |
| -i                 | 对dfb中所有整数字段使用int4类型                              |
| -I                 | 在geocolumn创建空间索引                                      |
| -S                 | 生成简单几何而不是多重几何                                   |
| -t<dimensionality> | 强迫几何成为“2D”、“3DZ”、“3DM”或“4D”之一                     |
| -w                 | 以WKT格式输出                                                |
| -W <encoding>      | 定义字符编码方式                                             |
| -N <policy>        | null数据处理方式，(insert*,skip,abort)                       |
| -n                 | 仅导入dbf文件                                                |
| -T<tablespace>     | 为新表定义tablespace，索引仍然是默认的tablespace             |
| -X <tablespace>    | 为新表的索引定义tablespace                                   |



## postgres 导入栅格数据

进入postgre安装路径bin文件中，本机是<C:\Program Files\PostgreSQL\9.6\bin>，打开cmd命令行

### 命令行

```shell
<!-- 分块，切片存储到PostGIS数据库中 -->
raster2pgsql -s 4326 -I -C -M E:/test/raster/dem.tif -F -t 256x256 public.dem | psql -h localhost -p 5432 -U postgres -d postgres -W
                     指定坐标系        栅格文件路径                 地图瓦片    数据库的模式.表名                                                       数据库名称

<!-- 以单个文件方式存储到PostGIS数据库中 -->
raster2pgsql -s 4326 -I -C -M E:/test/raster/dem.tif public.dem | psql -h localhost -p 5432 -U postgres -d postgres -W
                                                                                                            host            port       username    database_name
-c 创建新表，并把栅格数据导入到表中，这是默认模式
-a 追加栅格数据到一个已经存在的表
-d 先drop掉表，然后创建新表，并把栅格数据导入到表中
-p 准备模式，只创建表，不导入数据.
#栅格处理过程：把适当的约束条件注册（写入）栅格系统表中。
```

```shell
// 切片存储
raster2pgsql -s 4326 -I -M -C D:\test\dem.tif -t 256x256 public.demtile | psql -h localhost -p 5432 -U postgres -d Test –W 

// 源数据存储
raster2pgsql -s 4326 -C E:\data\zhengzhou.tif public.zhengzhou | psql -h localhost -p 5432 -U postgres -d postgres -W

// 批量操作
raster2pgsql -s 4326 -I -C -M F:\data\test\*.tif -F public.muil_raster | psql -h localhost -p 5432 -U postgres -d postgres -W
```

### 参数含义

| 参数     | 描述                                                         |
| -------- | ------------------------------------------------------------ |
| -C       | 用于栅格约束注册——比如栅格的srid, pixelsize 元数据信息等等，保证栅格在视图raster_columns能够合适地注册。 |
| -x       | 让设置最大边界约束失效，只有在-C参数同时使用时候才能使用这个参数。 |
| -r       | 为规则的块设置约束（空间唯一性约束和覆盖瓦片）。只有在同时使用-C 参数时，才能使用这个参数。 |
| -s<SRID> | 指定输出栅格使用指定的SRID。如果没有提供或者提供值为0，程序会检查栅格的元数据（比如栅格文件）以便决定一个合适的SRID。 |
| -b       | 从栅格要抽取的波段位置（下标从1开始）。想要抽取不止1个波段的话，使用逗号，分隔波段数字。如果没有指定，所有栅格的波段都会被抽取出来。 |
| -t       | TILE_SIZE：瓦片大小。 把每一个表的行表示的栅格切割成瓦片。 TILE_SIZE被表示成WIDTHxHEIGHT的形式，或者设置成值为“auto”来让加载程序使用第一个栅格参数计算合适的瓦片大小，然后把这个瓦片大小应用于所有的栅格。 |
| -R       | -register 把栅格以文件数据形式注册（栅格数据保存在数据库之外的文件系统中）。只有栅格的元数据和文件路径保存在数据库中（没有保存像素的数据）。 |
| -l       | OVERVIEW_FACTOR ：创建栅格的概览信息。如果factor值不只一个，使用逗号，进行分隔。创建的概览数据存储在数据库中，并且不受参数-R影响。注意你生成的SQL文件会包含存储数据的主表和概览表。 |
| -N       | NODATA ：指定没有NODATA值的波段的NODATA值。                  |
| -q       | 把PostgreSQL的id用引号包起来。                               |
| -f       | COLUMN :指定目标的栅格列名，默认是‘rast’。                   |
| -F       | 创建一个以文件名为列名的列                                   |
| -I       | 在栅格列上创建一个GiST索引                                   |
| -M       | Vacuum analyze栅格表                                         |
| -T       | tablespace ：指定新表的表空间。注意如果索引（包括primary key）依然会使用默认的表空，除非使用-X参数标识。 |
| -X       | tablespace ：指定表的索引表空间。如果使用了参数-I，那么这个参数可以应用于primary key和空间索引。 |
| -Y       | 使用copy语句而不是insert 语句。                              |
| -e       | 单独地执行每一条语句，不使用一个大的事务执行所有语句。       |
| -E       | ENDIAN ：控制栅格输出时候生成的二进制的字节顺序，如果值为0，表示取XDR，如果值为1，表示取NDR（默认取值）。现在我们只支持NDR了。 |
| -V       | version： 指定输出版本的格式，默认是0，当前值支持0。         |









