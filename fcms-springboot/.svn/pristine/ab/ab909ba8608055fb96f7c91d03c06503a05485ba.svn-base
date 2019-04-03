package com.yhlt.showcase.system.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.FileSystem;
import org.hyperic.sigar.FileSystemUsage;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.Swap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.system.entity.ServerStatusEntity;
import com.yhlt.showcase.system.entity.ServerStatusEntity.CpuInfoVo;
import com.yhlt.showcase.system.entity.ServerStatusEntity.DiskInfoVo;

/**
 * 系统运行状况
 * 
 */
@Controller
@RequestMapping(value = "/admin/system/serverStatus")
public class ServerStatusController {

	@RequestMapping()
	public String index(HttpServletRequest request) throws Exception {
		ServerStatusEntity status = new ServerStatusEntity();
		status.setServerTime(DateFormatUtils.format(Calendar.getInstance(),
				"yyyy-MM-dd HH:mm:ss"));
		status.setServerName(System.getenv().get("COMPUTERNAME"));

		Runtime rt = Runtime.getRuntime();
		status.setJvmTotalMem(rt.totalMemory() / (1024 * 1024));
		status.setJvmFreeMem(rt.freeMemory() / (1024 * 1024));
		status.setJvmMaxMem(rt.maxMemory() / (1024 * 1024));
		Properties props = System.getProperties();
		status.setServerOs(props.getProperty("os.name") + " "
				+ props.getProperty("os.arch") + " "
				+ props.getProperty("os.version"));
		status.setJavaHome(props.getProperty("java.home"));
		status.setJavaVersion(props.getProperty("java.version"));
		status.setJavaTmpPath(props.getProperty("java.io.tmpdir"));
		Sigar sigar = new Sigar();
		CpuInfo infos[] = sigar.getCpuInfoList();
		CpuPerc cpuList[] = sigar.getCpuPercList();
		double totalUse = 0L;
		for (int i = 0; i < infos.length; i++) {
			CpuPerc perc = cpuList[i];
			CpuInfoVo cpuInfo = new CpuInfoVo();
			cpuInfo.setId(infos[i].hashCode() + "");
			cpuInfo.setCacheSize(infos[i].getCacheSize());
			cpuInfo.setModel(infos[i].getModel());
			cpuInfo.setUsed(CpuPerc.format(perc.getCombined()));
			cpuInfo.setUsedOrigVal(perc.getCombined());
			cpuInfo.setIdle(CpuPerc.format(perc.getIdle()));
			cpuInfo.setTotalMHz(infos[i].getMhz());
			cpuInfo.setVendor(infos[i].getVendor());
			status.getCpuInfos().add(cpuInfo);
			totalUse += perc.getCombined();
		}
		String cpuu = CpuPerc.format(totalUse / status.getCpuInfos().size());
		cpuu = cpuu.substring(0, cpuu.length() - 1);
		status.setCpuUsage(cpuu);
		Mem mem = sigar.getMem();
		status.setTotalMem(mem.getTotal() / (1024 * 1024));
		status.setUsedMem(mem.getUsed() / (1024 * 1024));
		status.setFreeMem(mem.getFree() / (1024 * 1024));
		Swap swap = sigar.getSwap();
		status.setTotalSwap(swap.getTotal() / (1024 * 1024));
		status.setUsedSwap(swap.getUsed() / (1024 * 1024));
		status.setFreeSwap(swap.getFree() / (1024 * 1024));

		FileSystem fslist[] = sigar.getFileSystemList();
		FileSystemUsage usage = null;
		for (int i = 0; i < fslist.length; i++) {
			FileSystem fs = fslist[i];
			switch (fs.getType()) {
			case 0: // TYPE_UNKNOWN ：未知
			case 1: // TYPE_NONE
			case 3:// TYPE_NETWORK ：网络
			case 4:// TYPE_RAM_DISK ：闪存
			case 5:// TYPE_CDROM ：光驱
			case 6:// TYPE_SWAP ：页面交换
				break;
			case 2: // TYPE_LOCAL_DISK : 本地硬盘
				DiskInfoVo disk = new DiskInfoVo();
				disk.setDevName(fs.getDevName());
				disk.setDirName(fs.getDirName());
				usage = sigar.getFileSystemUsage(fs.getDirName());
				disk.setTotalSize(usage.getTotal() / (1024 * 1024));
				// disk.setFreeSize(usage.getFree()/(1024*1024));
				disk.setAvailSize(usage.getAvail() / (1024 * 1024));
				disk.setUsedSize(usage.getUsed() / (1024 * 1024));
				disk.setUsePercent(usage.getUsePercent() * 100D + "%");
				disk.setTypeName(fs.getTypeName());
				disk.setSysTypeName(fs.getSysTypeName());
				Map<String, String> diskWritesAndReadsOnInit = new HashMap<String, String>();
				String val = diskWritesAndReadsOnInit.get(fs.getDevName());
				long initTime = System.currentTimeMillis();
				;
				if (val != null) {
					long timePeriod = (System.currentTimeMillis() - initTime) / 1000;
					long origRead = Long.parseLong(val.split("\\|")[0]);
					long origWrite = Long.parseLong(val.split("\\|")[1]);
					disk.setDiskReadRate((usage.getDiskReadBytes() - origRead)
							/ timePeriod);
					disk.setDiskWriteRate((usage.getDiskWriteBytes() - origWrite)
							/ timePeriod);
				}

				status.getDiskInfos().add(disk);

			}
		}
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		ip = ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
		status.setIp(ip);
		request.setAttribute("serverStatusEntity", status);
		request.setAttribute("serverStatusJSON", JSONObject.toJSON(status));
		return "system/serverStatus/serverStatus_index";
	}

	/**
	 * 跳转在线用户页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/onlineUser")
	public String onlineUser() {
		return "system/onlineuser/onlineuser_index";
	}

}
