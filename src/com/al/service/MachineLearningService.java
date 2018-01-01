package com.al.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.al.basic.BasicServiceSupportImpl;
import com.al.dao.MachineLearningDao;
import com.al.model.MachineLearning;

@Service("machineLearningService")
public class MachineLearningService extends BasicServiceSupportImpl {
	
	@Resource(name="machineLearningDao")
	protected MachineLearningDao machineLearningDao;
	
	/**
	 * Spark ML 分类 - 逻辑回归
	 * @param machineLearning
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getLogisticRegression(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getLogisticRegression", machineLearning);
	}
	
	/**
	 * Spark ML 分类 - 决策树
	 * @param machineLearning
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getDecisionTree(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getDecisionTree", machineLearning);
	}
	
	/* ======================================================================================================== */
	
	/**
	 * Spark ML 聚类
	 * @param machineLearning
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getClustering(MachineLearning machineLearning) {
		List<MachineLearning> list = (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getClustering", machineLearning);
		/**
		 * 只对根节点赋值id
		 */
		for(MachineLearning clustering : list) {
			if(clustering.getChannelId() == 0) {
				clustering.setId(clustering.getClusteringId());
			}
		}
		
		changeClustering(list, 0, 573);
		changeClustering(list, 1, 3252);
		return list;
	}
	
	public void changeClustering(List<MachineLearning> list, int clusteringId, int pv) {
		removeClustering(list, clusteringId);
		list.addAll(getClusteringConfig(clusteringId, pv));
	}
	
	/**
	 * 删除指定的列族下的频道
	 * @param list
	 */
	public void removeClustering(List<MachineLearning> list, int clusteringId) {
		Iterator<MachineLearning> it = list.iterator();
		while(it.hasNext()) {
			MachineLearning ml = it.next();
			if(ml.getClusteringId() == clusteringId && ml.getChannelId() != 0) {
				it.remove();
			}
		}
	}
	
	/**
	 * 获得填充数据的频道集合
	 * @return
	 */
	public List<MachineLearning> getClusteringConfig(int clusteringId, int pv) {
		String [] configArray = {"国际","军事","财经","科技","体育","娱乐","时政","社会","教育"};
		List<MachineLearning> configList = new ArrayList<MachineLearning>();
		for(int i=0;i<configArray.length;i++) {
			MachineLearning config = new MachineLearning();
			config.setClusteringId(clusteringId);
			config.setChannelId(i + 1);
			config.setName(configArray[i]);
			config.setPv((pv / 45) * (i + 1));
			configList.add(config);
		}
		Collections.shuffle(configList);
		return configList;
	}
	
	/* ======================================================================================================== */
	
	/**
	 * Spark ML 推荐 - 获取用户信息
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getCfUser(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getCfUser", machineLearning);
	}
	
	/**
	 * Spark ML 推荐 - 获取物品(电影)信息
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getCfItem(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getCfItem", machineLearning);
	}
	
	/**
	 * Spark ML 推荐 - 按用户推荐的物品(电影)
	 * @param machineLearning
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getRecommendationItem(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getRecommendationItem", machineLearning);
	}
	
	/**
	 * Spark ML 推荐 - 按物品(电影)推荐的用户
	 * @param machineLearning
	 * @return List<MachineLearning> 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<MachineLearning> getRecommendationUser(MachineLearning machineLearning) {
		return (List<MachineLearning>)machineLearningDao.selectList("common.machinelearning.getRecommendationUser", machineLearning);
	}
}