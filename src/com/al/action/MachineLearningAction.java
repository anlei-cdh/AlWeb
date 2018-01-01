package com.al.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.al.basic.BasicActionSupportImpl;
import com.al.model.MachineLearning;
import com.al.service.MachineLearningService;
import com.al.util.JsonHelper;

@Controller("machineLearningAction")
public class MachineLearningAction extends BasicActionSupportImpl {
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name="machineLearningService")
	private MachineLearningService machineLearningService;
	
	/**
	 * Spark ML 分类 - 逻辑回归
	 */
	public void getLogisticRegression() {
		MachineLearning machineLearning = new MachineLearning();
		List<MachineLearning> list = machineLearningService.getLogisticRegression(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Spark ML 分类 - 决策树
	 */
	public void getDecisionTree() {
		MachineLearning machineLearning = new MachineLearning();
		List<MachineLearning> list = machineLearningService.getDecisionTree(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/* ======================================================================================================== */
	
	/**
	 * Spark ML 聚类
	 */
	public void getClustering() {
		MachineLearning machineLearning = new MachineLearning();
		List<MachineLearning> list = machineLearningService.getClustering(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/* ======================================================================================================== */
	
	/**
	 * Spark ML 推荐 - 获取用户信息
	 */
	public void getCfUser() {
		MachineLearning machineLearning = new MachineLearning();
		List<MachineLearning> list = machineLearningService.getCfUser(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Spark ML 推荐 - 获取物品(电影)信息
	 */
	public void getCfItem() {
		MachineLearning machineLearning = new MachineLearning();
		List<MachineLearning> list = machineLearningService.getCfItem(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Spark ML 推荐 - 按用户推荐的物品(电影)
	 */
	public void getRecommendationItem() {
		String id = this.getRequest().getParameter("userid");
		MachineLearning machineLearning = new MachineLearning();
		machineLearning.setId(Integer.parseInt(id));
		List<MachineLearning> list = machineLearningService.getRecommendationItem(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
	/**
	 * Spark ML 推荐 - 按物品(电影)推荐的用户
	 */
	public void getRecommendationUser() {
		String id = this.getRequest().getParameter("movieid");
		MachineLearning machineLearning = new MachineLearning();
		machineLearning.setId(Integer.parseInt(id));
		List<MachineLearning> list = machineLearningService.getRecommendationUser(machineLearning);
		JsonHelper.printBasicJsonList(getResponse(), list);
	}
	
}
