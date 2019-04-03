package com.yhlt.showcase.blockchain.command;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yhlt.showcase.blockchain.model.dto.KeyPairs;
import com.yhlt.showcase.blockchain.model.dto.MultiBalance;
import com.yhlt.showcase.blockchain.model.dto.address.AddressInfoDto;
import com.yhlt.showcase.blockchain.model.dto.asset.BaseBalanceAsset;
import com.yhlt.showcase.blockchain.utils.ValidateUtil;

/**
 *
 * @author stone
 * @date 2018年3月27日 上午9:12:53
 */
public class AddressCommand extends BaseCommand {

	public AddressCommand(String ip, String port, String login, String password) {
		try {
			initialize(ip, port, login, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建一个新地址
	 *
	 * @return 生成的地址
	 * @throws Exception
	 * @command addnewaddr
	 */
	public String addNewAddr() throws Exception {
		JSONObject jsonObject = exec(CommandEnum.ADDNEWADDR);
		return jsonObject.getString("result");
	}

	/**
	 * 创建一个多签地址（此方法需要再次将地址导入钱包，建议采用addMultiAddr的方法）
	 *
	 * @param numberOfSigRequired
	 *            The number of required signatures
	 * @param publicKeys
	 *            A json array of keys which are addresses or hex-encoded public
	 *            keys
	 * @return
	 * @throws Exception
	 *
	 * @command setupmulti
	 */
	public String setupMulti(int numberOfSigRequired, String[] publicKeys) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SETUPMULTI, numberOfSigRequired,
				JSONArray.parseArray(JSON.toJSONString(publicKeys)));
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return "";
		}
		return resultObj.getString("result");
	}

	/**
	 * Add a nrequired-to-sign multisignature address to the wallet. Each key is
	 * a address or hex-encoded public key.
	 *
	 * @param numberOfSigRequired
	 *            The number of required signatures out of the n keys or
	 *            addresses.
	 * @param publicKeys
	 *            A json array of addresses or hex-encoded public keys
	 * @return
	 * @throws Exception
	 */
	public String addMultiAddr(int numberOfSigRequired, String[] publicKeys) throws Exception {
		JSONObject resultObj = exec(CommandEnum.ADDMULTIADDR, numberOfSigRequired,
				JSONArray.parseArray(JSON.toJSONString(publicKeys)));
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return "";
		}
		return resultObj.getString("result");
	}

	/**
	 * 导入私钥
	 *
	 * @param privateKey
	 * @throws Exception
	 * @command importprivkey
	 */
	public void importPrivdateKey(String privateKey) throws Exception {
		if (StringUtils.isBlank(privateKey)) {
			throw new Exception("私钥为空");
		} else {
			exec(CommandEnum.IMPORTPRIVKEY, privateKey);
		}
	}

	/**
	 * 导入地址
	 *
	 * @param address
	 *            地址
	 * @throws Exception
	 * @command importaddr
	 */
	public void importAddress(String address) throws Exception {
		if (StringUtils.isBlank(address)) {
			throw new Exception("地址为空");
		} else {
			exec(CommandEnum.IMPORTADDR, address);
		}
	}

	/**
	 * 验证地址
	 *
	 * @param address
	 *            地址
	 * @return true/false
	 * @throws Exception
	 * @command validaddr
	 */
	public boolean validateAddress(String address) throws Exception {
		if (StringUtils.isBlank(address)) {
			return false;
		}
		JSONObject resultObj = exec(CommandEnum.VALIDADDR, address);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return false;
		}
		if (resultObj.containsKey("result")) { //$NON-NLS-1$
			JSONObject obj = JSONObject.parseObject(resultObj.get("result").toString()); //$NON-NLS-1$
			return obj.getBooleanValue("isvalid");
		}
		return false;
	}

	/**
	 * 查询所有地址
	 *
	 * @return 地址集合
	 * @throws Exception
	 * @command showaddrs
	 */
	public List<String> showAddresses() throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWADDRS);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return new ArrayList<String>();
		}
		List<String> addresses = new ArrayList<>();
		JSONArray jsonArray = resultObj.getJSONArray("result");
		for (Object object : jsonArray) {
			JSONObject obj = (JSONObject) object;
			String address = obj.getString("address");
			addresses.add(address);
		}
		return addresses;
	}

	/**
	 * 获取所有地址具体信息
	 *
	 * @return 地址信息集合
	 * @throws Exception
	 * @command showaddrs
	 */
	public List<AddressInfoDto> showAddressInfos() throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWADDRS);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return new ArrayList<AddressInfoDto>();
		}
		return JSON.parseArray(resultObj.get("result").toString(), AddressInfoDto.class);
	}

	/**
	 * Setup public/private key without wallet
	 *
	 * @param numberOfPairs
	 * @return
	 * @throws Exception
	 */
	public List<KeyPairs> setupKeyPairs(int numberOfPairs) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SETUPKEYPAIRS, numberOfPairs);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return new ArrayList<KeyPairs>();
		}
		return JSON.parseArray(resultObj.get("result").toString(), KeyPairs.class);
	}

	/**
	 * 查询所有资产
	 *
	 * @return MultiBalance
	 * @throws Exception
	 *
	 * @command showallbals
	 */
	public MultiBalance showAllBals() throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWALLBALS);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return null;
		}
		Map<String, Object> resultMap = resultObj.getJSONObject("result");
		MultiBalance multiBalance = new MultiBalance();
		if(resultMap!=null){
			resultMap.forEach((k, v) -> {
				multiBalance.put(k, JSON.parseArray(v.toString(), BaseBalanceAsset.class));
			});
		}else{
			return null;
		}
		return multiBalance;
	}

	/**
	 * 查询addresses下assets的情况
	 *
	 * @param addresses
	 * @param assets
	 * @return
	 * @throws Exception
	 */
	public MultiBalance showAllBals(String[] addresses, String[] assets) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWALLBALS, JSONArray.parseArray(JSON.toJSONString(addresses)),
				JSONArray.parseArray(JSON.toJSONString(assets)));
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return null;
		}
		Map<String, Object> resultMap = resultObj.getJSONObject("result");
		MultiBalance multiBalance = new MultiBalance();
		resultMap.forEach((k, v) -> {
			multiBalance.put(k, JSON.parseArray(v.toString(), BaseBalanceAsset.class));
		});
		return multiBalance;
	}

	/**
	 * 查询addresses的资产
	 *
	 * @param address
	 * @return
	 * @throws Exception
	 *
	 * @command showallbals
	 */
	public MultiBalance showAllBals(String[] addresses) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWALLBALS, JSONArray.parseArray(JSON.toJSONString(addresses)));
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return null;
		}
		Map<String, Object> resultMap = resultObj.getJSONObject("result");
		MultiBalance multiBalance = new MultiBalance();
		resultMap.forEach((k, v) -> {
			multiBalance.put(k, JSON.parseArray(v.toString(), BaseBalanceAsset.class));
		});
		return multiBalance;
	}

	/**
	 * {@link #showAllBals(String[]) with only 1 address}
	 *
	 * 查询address的资产情况
	 *
	 * @param address
	 * @return
	 * @throws Exception
	 *
	 * @command showallbals
	 */
	public MultiBalance showAllBals(String address) throws Exception {
		return showAllBals(new String[] { address });
	}

	/**
	 * 查询address下面的资产情况
	 *
	 * @param address
	 * @return
	 * @throws Exception
	 */
	public List<BaseBalanceAsset> showAddrBals(String address) throws Exception {
		JSONObject resultObj = exec(CommandEnum.SHOWADDRBALS, address);
		if (!ValidateUtil.validateJSONObject(resultObj)) {
			return new ArrayList<>();
		}
		return JSON.parseArray(resultObj.get("result").toString(), BaseBalanceAsset.class);
	}
}
