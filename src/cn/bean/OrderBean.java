package cn.bean;

/**
 * @author zhoumin
 */
public class OrderBean {
    private  String tickets_id;
    private String station_train_code;
    private String from_station;
    private String to_station;
    private String train_date;
    private String start_time;
    private String seat_no;
    private String seat_types;
    private String price;
    private boolean canendorse;
    private boolean isendorse;
    private String history_id;
    private Integer user_id;

    public String getTickets_id() {
        return tickets_id;
    }

    public void setTickets_id(String tickets_id) {
        this.tickets_id = tickets_id;
    }

    public String getStation_train_code() {
        return station_train_code;
    }

    public void setStation_train_code(String station_train_code) {
        this.station_train_code = station_train_code;
    }

    public String getFrom_station() {
        return from_station;
    }

    public void setFrom_station(String from_station) {
        this.from_station = from_station;
    }

    public String getTo_station() {
        return to_station;
    }

    public void setTo_station(String to_station) {
        this.to_station = to_station;
    }

    public String getTrain_date() {
        return train_date;
    }

    public void setTrain_date(String train_date) {
        this.train_date = train_date;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getSeat_no() {
        return seat_no;
    }

    public void setSeat_no(String seat_no) {
        this.seat_no = seat_no;
    }

    public String getSeat_types() {
        return seat_types;
    }

    public void setSeat_types(String seat_types) {
        this.seat_types = seat_types;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public boolean isCanendorse() {
        return canendorse;
    }

    public void setCanendorse(boolean canendorse) {
        this.canendorse = canendorse;
    }

    public boolean isIsendorse() {
        return isendorse;
    }

    public void setIsendorse(boolean isendorse) {
        this.isendorse = isendorse;
    }

    public String getHistory_id() {
        return history_id;
    }

    public void setHistory_id(String history_id) {
        this.history_id = history_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "OrderBean{" +
                "tickets_id='" + tickets_id + '\'' +
                ", station_train_code='" + station_train_code + '\'' +
                ", from_station='" + from_station + '\'' +
                ", to_station='" + to_station + '\'' +
                ", train_date='" + train_date + '\'' +
                ", start_time='" + start_time + '\'' +
                ", seat_no='" + seat_no + '\'' +
                ", seat_types='" + seat_types + '\'' +
                ", price='" + price + '\'' +
                ", canendorse=" + canendorse +
                ", isendorse=" + isendorse +
                ", history_id='" + history_id + '\'' +
                ", user_id=" + user_id +
                '}';
    }
}
