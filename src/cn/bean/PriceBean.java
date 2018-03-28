package cn.bean;

/**
 * @author zhoumin
 */
public class PriceBean {
    private String WZ;//无座
    private String A1;//硬座
    private String A2;//软座
    private String A3;//硬卧
    private String A4;//软卧
    private String A6;//高级软卧
    private String F;//动卧
    private String O;//二等座
    private String M;//一等座
    private String A9;//商务座
    private String P;//商务座

    public String getWZ() {
        return WZ;
    }

    public void setWZ(String WZ) {
        this.WZ = WZ;
    }

    public String getA1() {
        return A1;
    }

    public void setA1(String a1) {
        A1 = a1;
    }

    public String getA2() {
        return A2;
    }

    public void setA2(String a2) {
        A2 = a2;
    }

    public String getA3() {
        return A3;
    }

    public void setA3(String a3) {
        A3 = a3;
    }

    public String getA4() {
        return A4;
    }

    public void setA4(String a4) {
        A4 = a4;
    }

    public String getA6() {
        return A6;
    }

    public void setA6(String a6) {
        A6 = a6;
    }

    public String getF() {
        return F;
    }

    public void setF(String f) {
        F = f;
    }

    public String getO() {
        return O;
    }

    public void setO(String o) {
        O = o;
    }

    public String getM() {
        return M;
    }

    public void setM(String m) {
        M = m;
    }

    public String getA9() {
        return A9;
    }

    public void setA9(String a9) {
        A9 = a9;
    }

    public String getP() {
        return P;
    }

    public void setP(String p) {
        P = p;
    }

    @Override
    public String toString() {
        return "PriceBean{" +
                "WZ='" + WZ + '\'' +
                ", A1='" + A1 + '\'' +
                ", A2='" + A2 + '\'' +
                ", A3='" + A3 + '\'' +
                ", A4='" + A4 + '\'' +
                ", A6='" + A6 + '\'' +
                ", F='" + F + '\'' +
                ", O='" + O + '\'' +
                ", M='" + M + '\'' +
                ", A9='" + A9 + '\'' +
                ", P='" + P + '\'' +
                '}';
    }
}
