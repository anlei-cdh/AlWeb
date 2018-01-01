package com.al.action;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.al.basic.BasicActionSupportImpl;
import com.al.model.Interactive;
import com.al.service.InteractiveService;
import com.al.util.JsonHelper;

@Controller("interactiveAction")
public class InteractiveAction extends BasicActionSupportImpl {
	
	private static final long serialVersionUID = 1L;
	
	private InteractiveService interactiveService = new InteractiveService();
	
	/**
	 * Impala 新闻热搜词
	 */
	public void getKeywordList() {		
		List<Interactive> list = interactiveService.getKeywordList();
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Kudu 五大门户信息
	 */
	public void getPortalList() {		
		List<Interactive> list = interactiveService.getPortalList();
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
}
