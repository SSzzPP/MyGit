<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 健身路径tab页  全景预览 -->
<script src='${staticURL}/js/scroll.js'></script>
<script src='${staticURL}/js/three.min.js'></script>
<script src='${staticURL}/js/photo-sphere-viewer.min.js'></script>
<style>
.noDataContent{
	font-size:16px;
	color:#999;
	padding-top: 17%;
	padding-left: 42%;
} 
</style>
<div id="noData" style="display:none">
	<p class="noDataContent">该设施暂未上传全景图</p>
</div>
<div id="previewContainer"  style="display:none">
	<div id='containerImg' style="width:100%;height:100%;color:#999"></div>
</div>
<script>
$(function(){
	var envImgUuid = '${pubEntity.equipmentImgUuids}';
	var PSV = null;	
	if(envImgUuid!=null&&envImgUuid!=""){
		var arr = envImgUuid.split(',');
		envImgView = arr[0];
		$("#previewContainer").show();
		PSV = new PhotoSphereViewer({
			//true为自动调用全景图，false为在后面加载全景图（通过.load()方法）
			autoload:true,
		    // Path to the panorama
		    panorama: '${dynamicURL}/admin/venue/equipment/type/showImg?uuid='+envImgView,
		    //显示导航条
		    navbar:true,
		    //图片旋转速度，默认为2rpm
		    anim_speed:'1rpm',
		    //图片加载时的提示文字,默认为loading
		    loading_msg:'',
		 	// Container
		    container: $("#containerImg")[0]
		}); 
		//PSV.load();
	}else{
		$("#noData").show();
	}
})
</script>