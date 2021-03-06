package com.thinkgem.jeesite.modules.letsapi.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.ImgUtils;

import net.sf.json.JSONObject;

/**
 * 文件上传工具类
 * 
 * @author yangdc
 * @date Apr 18, 2012
 * 
 * <pre>
 * </pre>
 */
public class UploadUtils {
	/**
	 * 表单字段常量
	 */
	public static final String FORM_FIELDS = "form_fields";
	/**
	 * 文件域常量
	 */
	public static final String FILE_FIELDS = "file_fields";

	// 最大文件大小
	private long maxSize = 50000000;
	// 定义允许上传的文件扩展名
	private Map<String, String> extMap = new HashMap<String, String>();
	// 文件保存目录相对路径
	private String basePath = "userfiles";
	// 文件的目录名
	private String dirName = "images";
	// 上传临时路径
	private static final String TEMP_PATH = "/temp";
	private String tempPath = basePath + TEMP_PATH;
	// 若不指定则文件名默认为 yyyyMMddHHmmss_xyz
	private String fileName;

	// 文件保存目录路径
	private String savePath;
	// 文件保存目录url
	private String saveUrl;
	// 文件最终的url包括文件名
	private String fileUrl;

	public UploadUtils() {
		// 其中images,flashs,medias,files,对应文件夹名称,对应dirName
		// key文件夹名称
		// value该文件夹内可以上传文件的后缀名
		extMap.put("images", "gif,jpg,jpeg,png,bmp");
		extMap.put("flashs", "swf,flv");
		extMap.put("medias", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("files", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
	}

	/**
	 * 文件上传
	 * 
	 * @param request
	 * @return infos info[0] 验证文件域返回错误信息 info[1] 上传文件错误信息 info[2] savePath info[3] saveUrl info[4] fileUrl
	 */
	@SuppressWarnings("unchecked")
	public String[] uploadFile(HttpServletRequest request,String[] type) {
		String[] infos = new String[8];
		// 验证
		infos[0] = this.validateFields(request,type);
		String saveInfo="false";
		String saveThumbImg=null;
		String imgName=IdGen.uuid()+".jpg";
		String imgName2="thumbImg_"+imgName;
		if (infos[0].equals("true")) {
			String imgStr=request.getParameter("base64");
			saveInfo=this.generateImage(imgStr,imgName);
		}
		if(saveInfo.equals("true")&&type[1].equals("chatphoto")) {
			saveThumbImg=this.getThumbImg(imgName, imgName2);
		}
		if (infos[0].equals("true")&&saveInfo.equals("true")) {
			infos[2] = savePath;
			infos[3] = saveUrl;
			infos[4] = fileUrl;
			infos[5] = saveInfo;
			infos[6] = imgName;
			infos[7] = imgName2;
		}
		if (infos[0].equals("true")&&type[1].equals("SendMoment")) {
			infos[2] = savePath;
			infos[3] = saveUrl;
		}
		return infos;
	}

	/**
	 * 上传验证,并初始化文件目录
	 * 
	 * @param request
	 */
	private String validateFields(HttpServletRequest request,String[] type) {
		String errorInfo = "true";
		// boolean errorFlag = true;
		// 获取内容类型
		String contentType = request.getContentType();
		int contentLength = request.getContentLength();
		// 文件保存目录路径
		savePath = Global.getUserfilesBaseDir() + basePath + "/";
		// 文件保存目录URL
		saveUrl = request.getContextPath() + "/" + basePath + "/";
		// 文件保存目录路径
		savePath =savePath + type[0] + "/app/"+ type[1]+"/";
		// 文件保存目录URL
		saveUrl =saveUrl + type[0] + "/app/"+ type[1]+"/";
		File uploadDir = new File(savePath);
		FileUtils.createDirectory(FileUtils.path(savePath));
		if (maxSize < contentLength) {
			// TODO
			System.out.println("上传文件大小超出文件最大大小");
			errorInfo = "上传文件大小超出文件最大大小[" + maxSize + "]";
		} else if (!ServletFileUpload.isMultipartContent(request)) {
			// TODO
			errorInfo = "请选择文件";
		} else if (!uploadDir.isDirectory()) {// 检查目录
			// TODO
			errorInfo = "上传目录[" + savePath + "]不存在";
		} else if (!uploadDir.canWrite()) {
			// TODO
			errorInfo = "上传目录[" + savePath + "]没有写权限";
		} else if (!extMap.containsKey(dirName)) {
			// TODO
			errorInfo = "目录名不正确";
		} else {
			// .../basePath/dirName/
			// 创建文件夹
			// .../basePath/dirName/yyyyMMdd/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String yy = sdf.format(new Date());
			savePath += yy + "/";
			saveUrl += yy + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
			String mm = sdf1.format(new Date());
			savePath += mm + "/";
			saveUrl += mm + "/";
			File dirFile1 = new File(savePath);
			if (!dirFile1.exists()) {
				dirFile1.mkdirs();
			}
			// 获取上传临时路径
			tempPath = request.getSession().getServletContext().getRealPath("/") + tempPath + "/";
			File file = new File(tempPath);
			if (!file.exists()) {
				file.mkdirs();
			}
		}

		return errorInfo;
	}

	/**
	 * 处理上传内容
	 * 
	 * @param request
	 * @param maxSize
	 * @return
	 */
//	@SuppressWarnings("unchecked")
	private Map<String, Object> initFields(HttpServletRequest request) {

		// 存储表单字段和非表单字段
		Map<String, Object> map = new HashMap<String, Object>();

		// 第一步：判断request
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 第二步：解析request
		if (isMultipart) {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// 阀值,超过这个值才会写到临时目录,否则在内存中
			factory.setSizeThreshold(1024 * 1024 * 10);
			factory.setRepository(new File(tempPath));

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			upload.setHeaderEncoding("UTF-8");

			// 最大上传限制
			upload.setSizeMax(maxSize);

			/* FileItem */
			List<FileItem> items = null;
			// Parse the request
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 第3步：处理uploaded items
			if (items != null && items.size() > 0) {
				Iterator<FileItem> iter = items.iterator();
				// 文件域对象
				List<FileItem> list = new ArrayList<FileItem>();
				// 表单字段
				Map<String, String> fields = new HashMap<String, String>();
				while (iter.hasNext()) {
					FileItem item = iter.next();
					// 处理所有表单元素和文件域表单元素
					if (item.isFormField()) { // 表单元素
						String name = item.getFieldName();
						String value = item.getString();
						fields.put(name, value);
					} else { // 文件域表单元素
						list.add(item);
					}
				}
				map.put(FORM_FIELDS, fields);
				map.put(FILE_FIELDS, list);
			}
		}
		return map;
	}

	/**
	 * 保存文件
	 * 
	 * @param obj
	 *            要上传的文件域
	 * @param file
	 * @return
	 */
	private String saveFile(FileItem item) {
		String error = "true";
		String fileName = item.getName();
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

		if (item.getSize() > maxSize) { // 检查文件大小
			// TODO
			error = "上传文件大小超过限制";
		} else if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {// 检查扩展名
			error = "上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。";
		} else {
			String newFileName;
			if ("".equals(fileName.trim())) {
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			} else {
				newFileName = fileName + "." + fileExt;
			}
			// .../basePath/dirName/yyyyMMdd/yyyyMMddHHmmss_xxx.xxx
			fileUrl = saveUrl + newFileName;
			try {
				File uploadedFile = new File(savePath, newFileName);

				item.write(uploadedFile);

				/*
				 * FileOutputStream fos = new FileOutputStream(uploadFile); // 文件全在内存中 if (item.isInMemory()) { fos.write(item.get()); } else { InputStream is = item.getInputStream(); byte[] buffer =
				 * new byte[1024]; int len; while ((len = is.read(buffer)) > 0) { fos.write(buffer, 0, len); } is.close(); } fos.close(); item.delete();
				 */
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("上传失败了！！！");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return error;
	}

	/**
	 * 
	
	  * generateImage(保存图片)

	  * @Title: generateImage
	
	  * @param @param imgStr
	  * @param @param baseDir
	  * @param @return    设定文件
	
	  * @return String    返回类型
	
	  * @throws
	 */
	private  String  generateImage(String imgStr,String imgName) {
		
		String saveinfo=null;
		if (imgStr == null){ // 图像数据为空
			saveinfo="false";
			return saveinfo;
		}	
		imgStr = imgStr.replaceAll("data:image/jpeg;base64,", "");  
		try {
			// Base64解码
			byte[] b = Base64.decodeBase64(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpeg图片
			OutputStream out = new FileOutputStream(savePath + imgName);
			out.write(b);
			out.flush();
			out.close();
			saveinfo="true";
		} catch (Exception e) {
			saveinfo=e.getMessage();
			e.printStackTrace();
		}
		return saveinfo;
	}
private  String  getThumbImg(String imgName, String imgName2) {
		
		String saveThumbImg="false";
			ResizeImage r = new ResizeImage();
		try {
			 float times = 7f;
	        BufferedImage f=r.getImage(savePath + imgName);
	        r.writeHighQuality(r.resizeImage(f,times), savePath,imgName2);
			
	        saveThumbImg="true";
		} catch (Exception e) {
			saveThumbImg=e.getMessage();
			e.printStackTrace();
		}
		return saveThumbImg;
	}
/**  
* <p>Description:发送朋友圈 </p>      
* @author tao_yonggang  
* @date 2018年11月14日  
* @version 1.0  
*/ 
public Map<String,Object> filesUpload(HttpServletRequest request,MultipartFile[] files,String[] type) {
	 List<String> list = new ArrayList<String>();
	 List<String> listthumbImg = new ArrayList<String>();
	 Map<String,Object> retMap = new HashMap<String, Object>();
		String[] infos = this.uploadFile(request,type);
		String errorInfo = infos[0];
		String savePath = infos[2];
		String saveUrl = infos[3];
		if(errorInfo.equals("true")) {
			if (files != null && files.length > 0) {
		         for (int i = 0; i < files.length; i++) {
		             MultipartFile file = files[i];
		             String imgName=IdGen.uuid()+".jpg";
		             // 保存文件
		             retMap= this.saveFile(file,list,listthumbImg,savePath,saveUrl,imgName);
		         }
		     }else {
		    	 retMap.put("list", null);
		     }
		}else {
			retMap.put("list", null);
		}
	return retMap;
}
/**  
* <p>Description:发送朋友圈 </p>      
* @author tao_yonggang  
* @date 2018年11月14日  
* @version 1.0  
*/ 
private Map<String,Object> saveFile(MultipartFile file,List<String> list,List<String> listthumbImg,String savePath,
        String saveUrl,String imgName) {
	Map<String,Object> retMap = new HashMap<String, Object>();
	String imgName2="thumbImg_"+imgName;
    // 判断文件是否为空
    if (!file.isEmpty()) {
        try {
			list.add(saveUrl+imgName);
			listthumbImg.add(saveUrl+"thumbImg_/"+imgName2);
            File saveDir = new File(savePath+imgName);
            File saveDirthumbImg = new File(savePath+"thumbImg_/"+imgName2);
            if (!saveDir.getParentFile().exists())
                saveDir.getParentFile().mkdirs();
            if (!saveDirthumbImg.getParentFile().exists())
            	saveDirthumbImg.getParentFile().mkdirs();
            // 转存文件
            file.transferTo(saveDir);
            ImgUtils.compressPictureByQality(saveDir,saveDirthumbImg, (float) 0.5);
            retMap.put("list", list);
            retMap.put("listthumbImg", listthumbImg);
            return retMap;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return retMap;
}
	/** **********************get/set方法********************************* */

	public String getSavePath() {
		return savePath;
	}

	public String getSaveUrl() {
		return saveUrl;
	}

	public long getMaxSize() {
		return maxSize;
	}

	public void setMaxSize(long maxSize) {
		this.maxSize = maxSize;
	}

	public Map<String, String> getExtMap() {
		return extMap;
	}

	public void setExtMap(Map<String, String> extMap) {
		this.extMap = extMap;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
		tempPath = basePath + TEMP_PATH;
	}

	public String getDirName() {
		return dirName;
	}

	public void setDirName(String dirName) {
		this.dirName = dirName;
	}

	public String getTempPath() {
		return tempPath;
	}

	public void setTempPath(String tempPath) {
		this.tempPath = tempPath;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
