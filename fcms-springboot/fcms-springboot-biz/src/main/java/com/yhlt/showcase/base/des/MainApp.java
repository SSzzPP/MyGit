package com.yhlt.showcase.base.des;

import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.JSONArray;

public class MainApp {
    private static final String  SKEY    = "fcms2o18";
    private static final Charset CHARSET = Charset.forName("UTF-8");

    public static void main(String[] args) {
        // 待加密内容
        String str = "{\"area\":\"\",\"birthday\":\"2018/10/23\",\"id\":\"88\",\"loginName\":\"1102398564\",\"mobile\":\"15263031201\",\"nickName\":\"昵称1\",\"sex\":\"女\",\"timestamp\":\"1540543444000\",\"userDesc\":\"个性签名\"}";
        String encryptResult = DesUtil.encrypt(str, CHARSET, SKEY);
        System.out.println(encryptResult);
        System.out.println(encryptResult.length());
        // 直接将如上内容解密
        String decryResult = "";
        try {
            decryResult = DesUtil.decrypt(encryptResult, CHARSET, SKEY);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        System.out.println(decryResult);
        
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String fromDate = simpleFormat.format(new Date());
        String toDate = simpleFormat.format(new Date());
        long from;
        long to  ;
        int minutes = 0;
		try {
			from = simpleFormat.parse(fromDate).getTime();
			 to = simpleFormat.parse(toDate).getTime();
			 minutes = (int) ((to - from)/(1000 * 60));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("分钟差"+minutes);
		
		Long a = 1540279238379L; 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");//这个是你要转成后的时间的格式
		String sd = sdf.format(new Date(a));   // 时间戳转换成时间

		System.out.println(sd);

    }
}