package com.yhlt.showcase.blockchain.command;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.permission.Permission;
import com.yhlt.showcase.blockchain.utils.ConvertUtil;

/**
 * 权限
 *
 * @author stone
 * @date 2018年3月2日 下午6:59:23
 */
public class PermissionCommand extends BaseCommand {
	/**
	 * 赋权
	 *
	 * @param address
	 *            地址
	 * @param permission
	 *            Permission strings Include:
	 *            connect,send,receive,sell,mine,root,admin,setup Asset
	 *            permission: assetname.sell,root Datamod permission:
	 *            datamodname.write,admin,root
	 * @return txid
	 * @throws Exception
	 *             e.g. ratify "ADDR" datamod1.root,write
	 */
	public String ratify(String address, String permission) throws Exception {
		JSONObject resultObj = exec(CommandEnum.RATIFY, address, permission);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * 取消权限
	 *
	 * @param address
	 *            地址
	 * @param permission
	 *            Permission strings. Global:
	 *            connect,send,receive,sell,mine,root,admin,setup Per-asset:
	 *            asset-id.sell,root Per-datamod: datamodId.write,admin,root
	 * @return txid
	 * @throws Exception
	 *
	 *             e.g. cancel "ADDR" connect,send,receive
	 */
	public String cancel(String address, String permission) throws Exception {
		JSONObject resultObj = exec(CommandEnum.CANCEL, address, permission);
		return ConvertUtil.getResult(resultObj, String.class);
	}

	/**
	 * 查询权限
	 *
	 * @param permissions
	 *            Permission strings, possible values:
	 *            connect,send,receive,sell,mine,root,admin,setup."*" for all
	 *            permissions . Default: *.
	 * @return
	 * @throws Exception
	 */
	public List<Permission> showPermissions(String permissions) throws Exception {
		if (StringUtils.isBlank(permissions)) {
			permissions = "*";
		}
		JSONObject resultObj = exec(CommandEnum.SHOWPERMISSIONS, permissions);
		return ConvertUtil.getArrayResult(resultObj, Permission.class);
	}
	/**
	 * 查询address的所有权限
	 * @param address   若为多个地址 可以英文,号连接
	 * @return
	 * @throws Exception
	 */
	public List<Permission> showPermissionsByAddr(String address) throws Exception{
		JSONObject resultObj=exec(CommandEnum.SHOWPERMISSIONS,"*",address);
		return ConvertUtil.getArrayResult(resultObj, Permission.class);
	}
}
