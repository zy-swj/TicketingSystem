package cn.helper;

import javax.net.ssl.HttpsURLConnection;

/**
 * @author zhoumin
 */
public class IgnoreSSL {
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
}
