package com.al.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.al.basic.BasicActionSupportImpl;
import com.al.model.Learning;
import com.al.service.LearningService;
import com.al.util.JsonHelper;

@Controller("learningAction")
public class LearningAction extends BasicActionSupportImpl {
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name="learningService")
	private LearningService learningService;
	
	/**
	 * Spark MLlib 性别分类
	 */
	public void getGenderList() {		
		Learning learning = new Learning();
		List<Learning> list = learningService.getGenderList(learning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Spark MLlib 性别分类
	 */
	public void getChannelList() {		
		Learning learning = new Learning();
		List<Learning> list = learningService.getChannelList(learning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
}
