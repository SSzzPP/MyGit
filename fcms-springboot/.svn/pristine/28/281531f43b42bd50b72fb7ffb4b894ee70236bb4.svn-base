package com.yhlt.showcase.system.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.DepartmentDao;
import com.yhlt.showcase.system.entity.DepartmentEntity;

/**
 * 组织机构-部门
 * 
 * @author wj
 * @date 2014年12月25日20:22:24
 */
@Component
@Transactional
@BusinessLog(service = "部门信息管理")
@DataPermission
public class DepartmentService extends BaseService<DepartmentEntity, DepartmentDao> {
	/**
	 * 保存对象并且返回Map
	 * 
	 * @param t
	 * @return Map<String, Object> easyUI-jsonMap
	 */
	public DepartmentEntity noLogsave(DepartmentEntity t) {
		t = dao.save(t);
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public void getLayers(Long parentId, Map<String, Object> layers) {
		DepartmentEntity entity = findOne(parentId);
		if (entity != null) {
			List<Long> ids = (List<Long>) layers.get("ids");
			ids.add(0, entity.getId());
			List<String> names = (List<String>) layers.get("names");
			names.add(0, entity.getName());
			Long tempPid = entity.getParentId();
			if (tempPid != 0) {
				getLayers(tempPid, layers);
			}
		}
	}
}
