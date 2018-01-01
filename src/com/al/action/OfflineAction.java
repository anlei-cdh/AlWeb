package com.al.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.al.basic.BasicActionSupportImpl;
import com.al.model.Dimension;
import com.al.service.DimensionService;
import com.al.util.JsonHelper;

@Controller("offlineAction")
public class OfflineAction extends BasicActionSupportImpl {
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name="dimensionService")
	private DimensionService dimensionService;
	
	/**
	 * Hive/MapReduce 流量统计
	 */
	public void getOfflineList() {
		Dimension dimension = new Dimension();
		List<Dimension> list = dimensionService.getOfflineList(dimension);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
}
