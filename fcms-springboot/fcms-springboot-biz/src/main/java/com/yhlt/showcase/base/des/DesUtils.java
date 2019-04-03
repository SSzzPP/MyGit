package com.yhlt.showcase.base.des;



import javax.crypto.Cipher;

import org.apache.commons.lang3.StringUtils;

import java.security.Key;
import java.security.Security;


/**
 * 注:
 * 1、DES使用56位密钥,以现代计算能力,24小时内即可被破解;
 * 2、3DES(即Triple DES)是DES向AES过渡的加密算法(1999年,NIST将3-DES指定为过渡的加密标准)。使用3条56位的密钥对 数据进行三次加密。
 * 3、DES算法的加密密钥是根据用户输入的密码生成的,该算法把64位密码中的第8位、第16位、第24位、第32位、第40位、第48位、第56位、第64位作为奇偶校验位,在计算密钥时要忽略这8位.
 * 在generateKey()生成的随机密钥为8位(64bit)
 *
 * @author rongchao
 * @Date 18-10-24
 */
public class DesUtils {

    /**
     * 加密方法
     *
     * @param keyData 密钥(用户名)
     * @param str     要加密的字符串(密码)
     * @return
     * @throws Exception
     * @author sigangjun
     */
    public static String encrypt(String keyData, String str) throws Exception {
        if (StringUtils.isNotBlank(str)) {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
            Key key = getKey(keyData.getBytes("utf-8"));
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            return byteArr2HexStr(cipher.doFinal(str.getBytes("utf-8")));
        } else {
            return str;
        }
    }

    /**
     * 解密方法
     *
     * @param keyData 密钥
     * @param str     要解密的字符串
     * @return
     * @throws Exception
     * @author sigangjun
     */
    public static String decrypt(String keyData, String str) throws Exception {
        if (!StringUtils.isBlank(str)) {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
            Key key = getKey(keyData.getBytes("utf-8"));
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.DECRYPT_MODE, key);
            return new String(cipher.doFinal(hexStr2ByteArr(str)), "utf-8");
        } else {
            return str;
        }
    }

    private static String byteArr2HexStr(byte[] arrB) throws Exception {
        int iLen = arrB.length;
        StringBuffer sb = new StringBuffer(iLen * 2);
        for (int i = 0; i < iLen; i++) {
            int intTmp = arrB[i];
            while (intTmp < 0) {
                intTmp = intTmp + 256;
            }
            if (intTmp < 16) {
                sb.append(0);
            }
            sb.append(Integer.toString(intTmp, 16));
        }
        return sb.toString();
    }

    private static byte[] hexStr2ByteArr(String strln) throws Exception {
        byte[] arrB = strln.getBytes();
        int iLen = arrB.length;
        byte[] arrOut = new byte[iLen / 2];
        for (int i = 0; i < iLen; i = i + 2) {
            String strTmp = new String(arrB, i, 2);
            arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
        }
        return arrOut;
    }

    private static Key getKey(byte[] arrBTmp) throws Exception {
        byte[] arrB = new byte[8];
        for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
            arrB[i] = arrBTmp[i];
        }
        Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");
        return key;
    }

    public static void main(String[] args) {
        String str = "{\"area\":\"辽宁路街道\",\"birthday\":\"2018/10/23\",\"id\":\"1\",\"loginName\":\"15263031201\",\"mobile\":\"15263031201\",\"nickName\":\"昵称\",\"sex\":\"男\",\"timestamp\":\"1540279238379\",\"userDesc\":\"个性签名\"}";
        try {
            String result = DesUtils.encrypt("fcms2o18", str);
            System.out.println(result);
            String result2 = DesUtils.decrypt("fcms2o18", "AAD88CFF98B1C99309BBF55B06E674F50D02A67C7139CAD66173F4E61AC0B59FF36F3E2B35C5047D8A2103E1CDE99CF0503723BCCB4003EB8FF2607E9DA5609C61F936E86B4A240FE97E57037D8B9458FA168EDE440898E2D5A39125EE9186EFFB5F09832840D42F2A0C74B735E0041C4EE63133F3E5EA776FB6081F5586A39C01F201C2D5EFA0E3A6C85F2CE3DDFDA1442EFF1718685D4DB58D5FBA79CFE1E2785FA04BFF307C40741724C0F0898C471ECCE95F822C2B71199B597332F0BD78");
            System.out.println(result2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
