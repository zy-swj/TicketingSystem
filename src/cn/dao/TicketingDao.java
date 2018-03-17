package cn.dao;

import cn.bean.TicketingBean;
import org.junit.jupiter.api.Test;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author zhoumin
 * @date 2018/3/14 21:28
 */
public class TicketingDao {
    public List<TicketingBean> selectTickets(String train_date,String from_station_name,String to_station_name,String purpose_codes) {
        String from_station = getCodeByName().get(from_station_name);
        String to_station = getCodeByName().get(to_station_name);
        return null;
    }




   /* get code by name and add map
    * name_sation
    * url:https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030
    *获取json字符串，分析json字符串，进行分割，用正则表达式取出需要的部分存入hashmap
    * */
    public static Map<String, String> getCodeByName() {
        Map<String, String> map = new HashMap<String, String>();
        try{
            //获取json写入字符串
            ignoreSSL();//ignore ssl
            String urlStr = "https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030";
            URL url = new URL(urlStr);
            HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

            InputStreamReader input = new InputStreamReader(con.getInputStream(),
                    "utf-8");
            BufferedReader bfreader = new BufferedReader(input);

            StringBuffer stringBuffer = new StringBuffer();
            String nameStr = "";
            while ((nameStr = bfreader.readLine()) != null) {
                stringBuffer.append(nameStr);
            }


            //第一次处理json字符串
            String[] nameArr = nameStr.split("\\@");//获得json由@分割开
            Pattern p = Pattern.compile("[^\\@].*\\|.*");
            List<String> jsonLists = new ArrayList<String>();
            for (Object object : nameArr) {
                Matcher m = p.matcher(object.toString());
                if (m.find()) {
                    jsonLists.add(m.group(0));
                }
            }
            //第二次处理json字符互串
            for (int i = 0; i < jsonLists.size(); i++) {
                String temp = jsonLists.get(i).toString();
                String jsonArr[] = temp.split("\\|");
                List<String> mapLists = new ArrayList<String>();
                for (Object object : jsonArr) {
                    mapLists.add(object.toString());
                }
                map.put(mapLists.get(1), mapLists.get(2));

            }
        }
        catch (Exception e){
            System.out.print("请求超时！！！");
        }
        return map;

    }

    /*
     *Ignore the 12306 certificate.
     *
     * */
    public static void ignoreSSL() throws Exception {
        javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
        javax.net.ssl.TrustManager ignoreSSL = new miTM();
        trustAllCerts[0] = ignoreSSL;
        javax.net.ssl.SSLContext sc = javax.net.ssl.SSLContext
                .getInstance("SSL");
        sc.init(null, trustAllCerts, null);
        HttpsURLConnection.setDefaultSSLSocketFactory(sc
                .getSocketFactory());
    }

    static class miTM implements javax.net.ssl.TrustManager,
            javax.net.ssl.X509TrustManager {

        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public void checkServerTrusted(java.security.cert.X509Certificate[] certs,
                                       String authType) throws java.security.cert.CertificateException {
            return;
        }

        public void checkClientTrusted(java.security.cert.X509Certificate[] certs,
                                       String authType) throws java.security.cert.CertificateException {
            return;
        }
    }

    @Test
    public void test(){
        System.out.print(getCodeByName().get("南京"));
    }
}
