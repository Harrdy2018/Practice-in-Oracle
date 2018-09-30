# three.js绘制3D机房

***
## 代码如下所示，目前只搭建了机房的围墙和门之类的基本组件
* [本代码第三方库网站](https://github.com/mrdoob/three.js/)
```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">>
	<title>own 3D example!!</title>
	<style type="text/css">
	body
	{
		margin: 0px;
	}		
	</style>
</head>
<body>
<div id='divForRenderer'></div>
</body>
<script src="../three.js-master/build/three.js"></script>
<script src="../three.js-master/examples/js/libs/stats.min.js"></script>
<script src="../three.js-master/examples/js/controls/OrbitControls.js"></script>
<script>
	// 获取浏览器窗口的宽高，后续会用
	var width=window.innerWidth;
	var height=window.innerHeight;

	//定义场景
	var scene = new THREE.Scene();

	//定义辅助坐标系
	/*
	RGB颜色分别代表 XYZ 轴
	对于旋转 cube.rotation 正值是逆时针旋转,负值是顺时针旋转
	*/
	var AxesHelper=new THREE.AxesHelper( 1200 );
    scene.add(AxesHelper);

    //创建网格线
    //var GridHelper= new THREE.GridHelper(1000, 50);
    //scene.add(GridHelper);

	//定义相机
	//创建一个具有透视效果的摄像机
	var camera = new THREE.PerspectiveCamera( 45, width/height, 1, 100000 );
	camera.name = 'mainCamera';
	//设置摄像机位置，
    camera.position.x =0;
    camera.position.y =1000;
    camera.position.z =-1800;
    camera.up.x = 0;
    camera.up.y =1;
    camera.up.z =0;
    //设置相机将其朝向场景中心
    //camera.lookAt(scene.position)
    //console.log(scene.position);//Vector3 {x: 0, y: 0, z: 0}
    camera.lookAt({ x: 0, y: 0, z: 0 });

 	//灯光布置
 	/*
    AmbientLight: 环境光，基础光源，它的颜色会被加载到整个场景和所有对象的当前颜色上。
 	PointLight：点光源，朝着所有方向都发射光线
 	SpotLight ：聚光灯光源：类型台灯，天花板上的吊灯，手电筒等
 	DirectionalLight：方向光，又称无限光，从这个发出的光源可以看做是平行光.
    */
    var ambientLight= new THREE.AmbientLight(0xcccccc);
    ambientLight.position.set(0, 0,0);
    scene.add(ambientLight);
    var pointLight= new THREE.PointLight(0x555555);
    pointLight.shadow.camera.near =1;
    pointLight.shadow.camera.far = 5000;
    pointLight.position.set(0, 350, 0);
    pointLight.castShadow = true;//表示这个光是可以产生阴影的
    scene.add(pointLight);
 
	//定义渲染器
	var renderer = new THREE.WebGLRenderer({ 
		alpha: true, 
		antialias: true//抗锯齿效果为设置有效
	});
	renderer.setSize( width, height );
	//document.body.appendChild( renderer.domElement );
	var oDiv=document.getElementById('divForRenderer');
	oDiv.append(renderer.domElement);
    renderer.setClearColor(0x112233, 1.0);
    renderer.shadowMap.enabled = true;
    renderer.shadowMapSoft = true;

	//定义性能插件
    var stats = new Stats();
    document.body.appendChild(stats.dom);
    
    //定义用户交互插件 鼠标左键按住旋转，右键按住平移，滚轮缩放
   	var orbitControls= new THREE.OrbitControls( camera, renderer.domElement );
 	//如果使用animate方法时，将此函数删除
    //controls.addEventListener( 'change', render );
    // 使动画循环使用时阻尼或自转 意思是否有惯性
    orbitControls.enableDamping = true;
    //动态阻尼系数 就是鼠标拖拽旋转灵敏度
    orbitControls.dampingFactor = 0.9;
    //是否可以缩放
    orbitControls.enableZoom = true;
    //是否自动旋转
    orbitControls.autoRotate = false;
    //设置相机距离原点的最远距离
    //orbitControls.minDistance  = 200;
    //设置相机距离原点的最远距离
    //orbitControls.maxDistance  = 600;
    //是否开启右键拖拽
    orbitControls.enablePan = true;
 
	/***create lab***/ 
	/*
	width — Width of the sides on the X axis. Default is 1.
	height — Height of the sides on the Y axis. Default is 1.
	depth — Depth of the sides on the Z axis. Default is 1.
	widthSegments — Optional. Number of segmented faces along the width of the sides. Default is 1.
	heightSegments — Optional. Number of segmented faces along the height of the sides. Default is 1.
	depthSegments — Optional. Number of segmented faces along the depth of the sides. Default is 1
	*/
	//创建地板
	var geometryFloor = new THREE.BoxGeometry(2000,10,1600,0,0,1);
	console.log( geometryFloor.faces.length);
	//地板六面颜色
    for (let i = 0; i < geometryFloor.faces.length; i += 2) 
    {
        let hex =0x8ac9e2;
        geometryFloor.faces[i].color.setHex(hex);
        geometryFloor.faces[i + 1].color.setHex(hex);
    }
    //地板六面纹理
    var texture_up_floor= {vertexColors: THREE.FaceColors};
    console.log(texture_up_floor);
    var texture_down_floor=texture_up_floor;
    var texture_fore_floor=texture_up_floor;
    var texture_behind_floor=texture_up_floor;
    var texture_left_floor=texture_up_floor;
    var texture_right_floor=texture_up_floor;
    var texture_opacity_floor=1;
	var textureFloor = new THREE.TextureLoader().load('./pictures/floor.jpg');
	textureFloor.wrapS = THREE.RepeatWrapping;
	textureFloor.wrapT = THREE.RepeatWrapping;
	textureFloor.repeat.set( 5,5);
	texture_up_floor={map:textureFloor,transparent:true };
	var materialFloorArray = [];
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_fore_floor));
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_behind_floor));
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_up_floor));
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_down_floor));
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_right_floor));
    materialFloorArray.push(new THREE.MeshLambertMaterial(texture_left_floor)); 
	var floor= new THREE.Mesh( geometryFloor,materialFloorArray);
	floor.castShadow = true;
    floor.receiveShadow = true;
    floor.position.set(0,0,0);
	scene.add(floor);

	//创建围墙
	//创建墙的纹理,公司的墙就是一个纯白的石灰石墙
	var materialWall = new THREE.MeshLambertMaterial( { color: 0xffffff } );
	/*
	var textureWall= new THREE.TextureLoader().load('./pictures/wall.jpg');
	textureWall.wrapS = THREE.RepeatWrapping;
	textureWall.wrapT = THREE.RepeatWrapping;
	textureWall.repeat.set( 10,10);
	var materialWall=new THREE.MeshLambertMaterial({
		map:textureWall,
		transparent:true 
	});	
	*/
	//墙A 长、高、宽,墙A有一个门比较特别单独建门
	var geometryWallA1= new THREE.BoxGeometry(200,300,20,1,1,1);
	var wallA1= new THREE.Mesh(geometryWallA1,materialWall);
	wallA1.castShadow = true;
    wallA1.receiveShadow = true;
	wallA1.position.set(650,150,-600);
	scene.add(wallA1);
	var geometryWallA2= new THREE.BoxGeometry(1037,300,20,1,1,1);
	var wallA2= new THREE.Mesh(geometryWallA2,materialWall);
	wallA2.castShadow = true;
    wallA2.receiveShadow = true;
	wallA2.position.set(-231.5,150,-600);
	scene.add(wallA2);
	var geometryWallA3= new THREE.BoxGeometry(263,20,20,1,1,1);
	var wallA3= new THREE.Mesh(geometryWallA3,materialWall);
	wallA3.castShadow = true;
    wallA3.receiveShadow = true;
	wallA3.position.set(418.5,290,-600);
	scene.add(wallA3);	
	//墙B与墙A平行
	var geometryWallB= new THREE.BoxGeometry(1500,300,20,0,0,1);
	var wallB= new THREE.Mesh(geometryWallB,materialWall);
	wallB.castShadow = true;
    wallB.receiveShadow = true;
    wallB.position.set(0,150,600);
	scene.add(wallB);
	//墙C
	var geometryWallC= new THREE.BoxGeometry(20,300,1200,0,0,1);
	var wallC= new THREE.Mesh(geometryWallC,materialWall);
	wallC.castShadow = true;
    wallC.receiveShadow = true;
    wallC.position.set(750,150,0);
	scene.add(wallC);
	//墙D与墙C平行
	var geometryWallD= new THREE.BoxGeometry(20,300,1200,0,0,1);
	var wallD= new THREE.Mesh(geometryWallD,materialWall);
	wallD.castShadow = true;
    wallD.receiveShadow = true;
    wallD.position.set(-750,150,0);
	scene.add(wallD);

	//创建门130*265 门与门之间的间隔为3个单位，门与地板的距离，门与梁的距离为5个单位
	//创建门的纹理
	var textureDoor= new THREE.TextureLoader().load('./pictures/door.jpg');
	textureDoor.wrapS = THREE.RepeatWrapping;
	textureDoor.wrapT = THREE.RepeatWrapping;
	textureDoor.repeat.set(4,4);
	var materialDoor=new THREE.MeshLambertMaterial({
		map:textureDoor,
		transparent:true 
	});	
	//创建左边门130*265
	var geometryDoorA= new THREE.BoxGeometry(130,265,10,0,0,1);
	var doorA= new THREE.Mesh(geometryDoorA,materialDoor);
	doorA.castShadow = true;
    doorA.receiveShadow = true;
    doorA.position.set(485,142.5,-600);
	scene.add(doorA);
	//创建右边门130*265
	var geometryDoorB= new THREE.BoxGeometry(130,265,10,0,0,1);
	var doorB= new THREE.Mesh(geometryDoorB,materialDoor);
	doorB.castShadow = true;
    doorB.receiveShadow = true;
    doorB.position.set(352,142.5,-600);
	scene.add(doorB);	
	//在右边门上贴警示语
	var geometryNotice= new THREE.PlaneGeometry(60,30);
	var textureNotice= new THREE.TextureLoader().load('./pictures/notice.png');
	var materialNotice=new THREE.MeshLambertMaterial({
		map:textureNotice,
		transparent:false
	});	
	var notice= new THREE.Mesh( geometryNotice, materialNotice );
	notice.position.set(352,250,-610);
	notice.rotateX(-Math.PI);
	notice.rotateZ(-Math.PI);
	scene.add(notice);

	//循环渲染界面
	function animate() 
	{
        //更新控制器
        orbitControls.update();
        renderer.render( scene, camera );
 
        //更新性能插件
        stats.update();
        requestAnimationFrame(animate);
    }
	animate();
</script>>
</html>
```
