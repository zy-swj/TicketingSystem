package cn.bean;

/**
 * @author zhoumin
 * @date 2018/2/8 16:20
 */

public class TicketingBean {
    /*
     * info.get(3);// 车次信息
	 *  info.get(6); // 出发地
	 *  info.get(7);// 目的地
	 *  info.get(8);// 出发时间
	 *  info.get(9); // 到达时间
	 *  info.get(10);// 历时
	 *  info.get(11); // Y
	 * info.get(21); // 高级软卧
	 * info.get(23); // 软卧
	 * info.get(26); // 无座
	 * info.get(28); // 硬卧
	 * info.get(29); // 硬座
	 * info.get(30); // 二等座
	 * info.get(31);// 一等座
	 *  info.get(32); // 商务，特等座
	 */
    private String station_train_code;//车次
    private String from_station_name;//始发站名字
    private String to_station_name;//到达站名字
    private String start_time;//出发时间
    private String arrive_time;//到达时间
    private String lishi;//历时
    private String gjrw;//高级软卧
    private String rw;
    private String wz;
    private String yw;
    private String yz;
    private String ed;
    private String yd;
    private String td;

    public String getStation_train_code() {
        return station_train_code;
    }

    public void setStation_train_code(String station_train_code) {
        this.station_train_code = station_train_code;
    }

    public String getFrom_station_name() {
        return from_station_name;
    }

    public void setFrom_station_name(String from_station_name) {
        this.from_station_name = from_station_name;
    }

    public String getTo_station_name() {
        return to_station_name;
    }

    public void setTo_station_name(String to_station_name) {
        this.to_station_name = to_station_name;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getArrive_time() {
        return arrive_time;
    }

    public void setArrive_time(String arrive_time) {
        this.arrive_time = arrive_time;
    }

    public String getLishi() {
        return lishi;
    }

    public void setLishi(String lishi) {
        this.lishi = lishi;
    }

    public String getGjrw() {
        return gjrw;
    }

    public void setGjrw(String gjrw) {
        this.gjrw = gjrw;
    }

    public String getRw() {
        return rw;
    }

    public void setRw(String rw) {
        this.rw = rw;
    }

    public String getWz() {
        return wz;
    }

    public void setWz(String wz) {
        this.wz = wz;
    }

    public String getYw() {
        return yw;
    }

    public void setYw(String yw) {
        this.yw = yw;
    }

    public String getYz() {
        return yz;
    }

    public void setYz(String yz) {
        this.yz = yz;
    }

    public String getEd() {
        return ed;
    }

    public void setEd(String ed) {
        this.ed = ed;
    }

    public String getYd() {
        return yd;
    }

    public void setYd(String yd) {
        this.yd = yd;
    }

    public String getTd() {
        return td;
    }

    public void setTd(String td) {
        this.td = td;
    }

    @Override
    public String toString() {
        return "TicketingBean [station_train_code=" + station_train_code
                + ", from_station_name=" + from_station_name
                + ", to_station_name=" + to_station_name + ", start_time="
                + start_time + ", arrive_time=" + arrive_time + ", lishi="
                + lishi + ", gjrw=" + gjrw + ", rw=" + rw + ", wz=" + wz
                + ", yw=" + yw + ", yz=" + yz + ", ed=" + ed + ", yd=" + yd
                + ", td=" + td + "]";
    }
}
