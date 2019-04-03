package com.yhlt.showcase.system.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.yhlt.showcase.base.datapermission.DataPermission;
import com.yhlt.showcase.base.log.BusinessLog;
import com.yhlt.showcase.base.service.BaseService;
import com.yhlt.showcase.system.dao.FileDao;
import com.yhlt.showcase.system.entity.FileEntity;

/**
 * 附件
 * 
 * @author xunxun
 * @date 2015-1-20 下午1:57:11
 */
@Component
@Transactional
@BusinessLog(service = "上传文件管理")
@DataPermission
public class FileService extends BaseService<FileEntity, FileDao> {
	/**
	 * 更新文件信息pdfpath,swfpath
	 * 
	 * @param id
	 * @param pdfPath
	 * @param swfPath
	 */
	public void update(Long id, String pdfPath, String swfPath) {
		FileEntity fileEntity = findOne(id);
		fileEntity.setPdfPath(pdfPath);
		fileEntity.setSwfPath(swfPath);
		this.save(fileEntity);
	}
}
