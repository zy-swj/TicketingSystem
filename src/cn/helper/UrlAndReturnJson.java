package cn.helper;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import static cn.helper.IgnoreSSL.ignoreSSL;

/**
 * @author zhoumin
 */
public class UrlAndReturnJson {

    public static String returnJson(String urlString) throws Exception {
        ignoreSSL();
        URL url = new URL(urlString);
        HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

        InputStreamReader input = new InputStreamReader(con.getInputStream(),
                "utf-8");
        BufferedReader bufferedReader = new BufferedReader(input);

        StringBuffer stringBuffer = new StringBuffer();
        String tempStr = "";

        while ((tempStr = bufferedReader.readLine()) != null) {
            stringBuffer.append(tempStr);
        }
        return stringBuffer.toString();
    }
}
