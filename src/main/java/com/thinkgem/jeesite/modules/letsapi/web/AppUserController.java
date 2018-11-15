/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUserLoginLog;
import com.thinkgem.jeesite.modules.letsapi.entity.FriendInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MomentsInfo;
import com.thinkgem.jeesite.modules.letsapi.jwt.api.TokenMgr;
import com.thinkgem.jeesite.modules.letsapi.jwt.config.Constant;
import com.thinkgem.jeesite.modules.letsapi.jwt.model.SubjectModel;
import com.thinkgem.jeesite.modules.letsapi.service.AppUserService;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UploadUtils;
import com.thinkgem.jeesite.modules.letsapi.utils.jpush.JpushUtils;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 用户信息Controller
 * @author tao_yonggang
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${frontPath}/letsapi/appuser")
public class AppUserController extends BaseController {

	@Autowired
	private AppUserService appUserService;
	

	/**  
	* <p>Description:用户登录 </p>      
	* @author tao_yonggang  
	* @date 2018年10月17日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user){
		RtnData rtn = new RtnData();
		try {
			AppUser appUser = appUserService.login(user);
			if(appUser!=null){
				if(StringUtils.equals(user.getPassword(), appUser.getPassword())){
					if(StringUtils.equals(appUser.getLoginFlag(), "0")) {
						rtn.setMessage("您已经被禁止登录");
						rtn.setCode("1007");
						return toJsonByALWAYS(response, rtn);
					}
					// 生成TOKEN
					SubjectModel sub = new SubjectModel(appUser.getId(), appUser.getLoginName());//用户信息
					String token = TokenMgr.createJWT(IdGen.uuid(), Constant.JWT_ISS,TokenMgr.generalSubject(sub), Constant.JWT_TTL);
					response.addHeader("Authorization", token);
					// ==========插入登录日志=========
					String deviceType = request.getParameter("pType");
					AppUserLoginLog e = new AppUserLoginLog();
					e.preInsert();
					e.setImei(request.getParameter("imei")); // 设备唯一识别码
					e.setDeviceType("1".equals(deviceType) ? "ios" : "Android"); // 设备类型
					e.setLoginName(appUser.getLoginName());
					appUserService.insertUserLoginLog(e);
					// ==========插入结束=========
					rtn.setData(appUser);
					rtn.setMessage("登陆成功");
					rtn.setCode("0000");
					return toJsonByALWAYS(response, rtn);
				}else {
					rtn.setMessage("密码错误");
					rtn.setCode("1008");
					return toJsonByALWAYS(response, rtn);
				}
			}else{
				rtn.setMessage("账号错误");
				rtn.setCode("1009");
				return toJsonByALWAYS(response, rtn);
			}
		} catch (Exception e) {
			logger.error("登录异常:"+e.getMessage());
			rtn.setMessage("登录异常");
			rtn.setCode("500");
			return toJsonByALWAYS(response, rtn);
		}
	}

	/**
	 * @author zhai_shaobo
	 * app注册
	 */
	
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			user.setId(IdGen.uuid());
			rtn = appUserService.register(request, user);
			if (rtn.getCode().equals("0000")) {
				//注册成功 自动生成 用户初始购物账户
				user.setShopAccountId(IdGen.uuid());
				appUserService.shopAccount(request,user);
			    // 生成TOKEN
				SubjectModel sub = new SubjectModel(user.getId(), user.getLoginName());//用户信息
				String token = TokenMgr.createJWT(IdGen.uuid(), Constant.JWT_ISS,TokenMgr.generalSubject(sub), Constant.JWT_TTL);
				response.addHeader("Authorization", token);
			}
		} catch (Exception e) {
			rtn.setMessage("注册异常");
			rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:修改密码 </p>      
	* @author tao_yonggang  
	* @date 2018年10月18日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request,HttpServletResponse response, 
			AppUser user, Model model){
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.updatePassword(request, user);
		} catch (Exception e) {
			 rtn.setMessage("修改异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**
	 * @author zhai_shaobo
	 * app注册 成功之后 完善用户信息
	 */
	
	@RequestMapping(value = "perfect",method = RequestMethod.POST)
	public String perfect(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.perfect(request, user);	
		} catch (Exception e) {
			rtn.setMessage("信息完善异常!");
			rtn.setCode("500");
			logger.error("perfect---信息完善异常"+e.getMessage());
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:上传文件 </p>      
	* @author tao_yonggang  
	* @date 2018年10月19日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/uploadFile", method = RequestMethod.POST)
	public String uploadFile(HttpServletRequest request,HttpServletResponse response, Model model){
		RtnData rtn = new RtnData();
		Map<String,Object> mp = new HashMap<String, Object>();
		Map<String,Object> retMap = new HashMap<String, Object>();
		UploadUtils up = new UploadUtils();
		try {
			String[] type= {"images","photo"};
			String[] infos = up.uploadFile(request,type);
			String errorInfo = infos[0];
			String savePath = infos[2];
			String saveUrl = infos[3];
			String fileUrl = infos[4];
			String fileName = infos[6];
			mp.put("saveUrl", saveUrl);
			mp.put("fileName", fileName);
			if(errorInfo.equals("true")) {
				rtn = appUserService.updatePhoto(request,mp);
				if (rtn.getCode().equals("0000")) {
					retMap.put("errorInfo", errorInfo);
					retMap.put("savePath", savePath);
					retMap.put("saveUrl", saveUrl);
					retMap.put("fileUrl", fileUrl);
					retMap.put("fileName", fileName);
					rtn.setData(retMap);
					rtn.setMessage("文件上传成功");
					rtn.setCode("0000");
				}
			}else {
				retMap.put("errorInfo", errorInfo);
				rtn.setData(retMap);
				rtn.setMessage("文件上传失败");
				rtn.setCode("1010");
			}
			
		} catch (Exception e) {
			rtn.setMessage("文件夹创建异常");
			rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	
	/**
	 * @author zhai_shaobo
	 * app 获取好友列表信息
	 */
	
	@RequestMapping(value = "selectFriend",method = RequestMethod.POST)
	public String selectFriend(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.selectFriend(request, user);	
		} catch (Exception e) {
			rtn.setMessage("获取好友列表信息异常!");
			rtn.setCode("500");
			logger.error("selectFriend---好友列表信息异常"+e.getMessage());
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**
	 * @author zhai_shaobo
	 * app 个性化定制好友信息(用户可以对好友个性化其 loginname，phone，photo)
	 */
	
	@RequestMapping(value = "customizationFriend",method = RequestMethod.POST)
	public String customizationFriend(HttpServletRequest request, HttpServletResponse response, 
			Model model, FriendInfo user) {
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.customizationFriend(request, user);	
			if (rtn.getCode().equals("0000")) {
				FriendInfo userIn = new FriendInfo();
				userIn.setLoginName(user.getFriendLoginName());
				rtn = appUserService.selectFriendInfos(request, userIn);
				if (!rtn.getCode().equals("0000")) {
					rtn.setCode("500");
					rtn.setMessage("获取好友列表信息失败");
					rtn.setData(new ArrayList<FriendInfo>());
				}
			}
		} catch (Exception e) {
			rtn.setMessage("获取好友列表信息异常!");
			rtn.setCode("500");
			logger.error("selectFriend---好友列表信息异常"+e.getMessage());
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:上传文件--个性化定制头像图片</p>      
	* @author zhai_shaobo
	* @date 2018年10月24日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/uploadFilecust", method = RequestMethod.POST)
	public String uploadFilecust(HttpServletRequest request,HttpServletResponse response, Model model){
		RtnData rtn = new RtnData();
		Map<String,Object> mp = new HashMap<String, Object>();
		Map<String,Object> retMap = new HashMap<String, Object>();
		UploadUtils up = new UploadUtils();
		try {
			String[] type= {"images","photo"};
			String[] infos = up.uploadFile(request,type);
			String errorInfo = infos[0];
			String savePath = infos[2];
			String saveUrl = infos[3];
			String fileUrl = infos[4];
			String fileName = infos[6];
			mp.put("saveUrl", saveUrl);
			mp.put("fileName", fileName);
			if(errorInfo.equals("true")) {
				rtn = appUserService.uploadFilecust(request,mp);
				if (rtn.getCode().equals("0000")) {
					retMap.put("errorInfo", errorInfo);
					retMap.put("savePath", savePath);
					retMap.put("saveUrl", saveUrl);
					retMap.put("fileUrl", fileUrl);
					retMap.put("fileName", fileName);
					rtn.setData(retMap);
					rtn.setMessage("文件上传成功");
					rtn.setCode("0000");
				}
			}else {
				retMap.put("errorInfo", errorInfo);
				rtn.setData(retMap);
				rtn.setMessage("文件上传失败");
				rtn.setCode("1010");
			}
			
		} catch (Exception e) {
			rtn.setMessage("文件夹创建异常");
			rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:上传文件 </p>      
	* @author tao_yonggang  
	* @date 2018年10月19日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/uploadChatPhoto", method = RequestMethod.POST)
	public String uploadChatPhoto(HttpServletRequest request,HttpServletResponse response){
		RtnData rtn = new RtnData();
		Map<String,Object> retMap = new HashMap<String, Object>();
		UploadUtils up = new UploadUtils();
		try {
			String[] type= {"images","chatphoto"};
			String[] infos = up.uploadFile(request,type);
			String errorInfo = infos[0];
			String saveUrl = infos[3];
			String thumbImg = infos[7];
			String fileName = infos[6];
			if(errorInfo.equals("true")) {
				retMap.put("errorInfo", errorInfo);
				retMap.put("saveUrl", saveUrl+fileName);
				retMap.put("thumbImgUrl", saveUrl+thumbImg);
				rtn.setData(retMap);
				rtn.setCode("0000");
				rtn.setMessage("文件上传成功");
			}else {
				retMap.put("errorInfo", errorInfo);
				rtn.setData(retMap);
				rtn.setMessage("文件上传失败");
				rtn.setCode("1033");
			}
		} catch (Exception e) {
			rtn.setMessage("文件夹创建异常");
			rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**
	 * @author zhai_shaobo
	 * app 获取好友信息 可以多个好友信息  不关openfier
	 */
	
	@RequestMapping(value = "selectFriendInfos",method = RequestMethod.POST)
	public String selectFriendInfos(HttpServletRequest request, HttpServletResponse response, 
			Model model, FriendInfo user) {
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.selectFriendInfos(request, user);	
		} catch (Exception e) {
			rtn.setMessage("获取好友信息 异常!");
			rtn.setCode("500");
			logger.error("selectFriendInfos---获取好友信息 常"+e.getMessage());
		}
		return toJsonByALWAYS(response, rtn);
	}
	
	@RequestMapping(value = "jpushOfflineMessage", method = RequestMethod.POST)
	public String jpushOfflineMessage(HttpServletRequest request, HttpServletResponse response) {
		RtnData rtn = new RtnData();
		try {
			String userName = request.getParameter("userName");
			String msgType = request.getParameter("msgType");
			//String messageId = request.getParameter("messageId");
			if(StringUtils.isNotBlank(userName)) {
				// 获取当前用户登录的设备类型
				AppUserLoginLog e = appUserService.getUserLoginLog(new AppUserLoginLog(userName));
				// 获取要推送的离线信息
				//OfflineMessage msg = appUserService.getOfflineMesg(new OfflineMessage(messageId));
				if(e != null && StringUtils.isNotBlank(e.getDeviceType())) {
					Map<String, String> parm = new HashMap<String, String>();
					// 组装推送相关信息
					parm.put("msg", "1".equals(msgType) ? "您收到了一条加密消息" : "您收到了一条Lets Chat消息");
					parm.put("alias", userName);
					parm.put("msgTitle", "LETSCHAT");
					if("ios".equals(e.getDeviceType())) {
						JpushUtils.jpushIOS(parm);
					}else{
						JpushUtils.jpushAndroid(parm);
					}
				}else{
					logger.error("消息推送异常：推送设备类型或离线信息为空！");
				}
			}else{
				logger.error("消息推送异常：参数userName为空！");
			}
		} catch (Exception e) {
			rtn.setMessage("离线信息推送异常!");
			rtn.setCode("500");
			logger.error("消息推送异常：" + e.getMessage());
		}
		return toJsonByALWAYS(response, rtn); 
	}
	/**  
	* <p>Description:查询首页广告 </p>      
	* @author tao_yonggang  
	* @date 2018年11月12日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getHomeAd", method = RequestMethod.POST)
	public String  getDict(HttpServletRequest request,HttpServletResponse response,Dict dic){
		RtnData rtn=new RtnData();
		try {
			rtn = appUserService.getHomeAd(dic);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:发送朋友圈 </p>      
	* @author tao_yonggang  
	* @date 2018年11月14日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/SendMoment", method = RequestMethod.POST)
    public String SendMoment(@RequestParam("myfiles") MultipartFile[] files,HttpServletResponse response,
    		HttpServletRequest request,MomentsInfo momentsInfo) {
		RtnData rtn=new RtnData();
		UploadUtils up = new UploadUtils();
		String[] type= {"images","SendMoment"};
        try {
        	Map<String,Object> retMap=up.filesUpload(request,files,type);
        	if(retMap.get("list")!=null) {
                momentsInfo.preInsert();
                momentsInfo.setImgContents(StringUtils.strip(retMap.get("list").toString(),"[]")+"|"+StringUtils.strip(retMap.get("listthumbImg").toString(),"[]"));
                appUserService.insertSendMoment(momentsInfo);
                rtn.setCode("0000");
    			rtn.setMessage("朋友圈发送成功");
        	}else {
        		rtn.setCode("1055");
    			rtn.setMessage("朋友圈发送失败");
        	}
		} catch (Exception e) {
			 rtn.setMessage("朋友圈发送异常");
			 rtn.setCode("500");
		}
        return toJsonByALWAYS(response, rtn);
    }

  
}