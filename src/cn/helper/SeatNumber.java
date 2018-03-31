package cn.helper;

import org.junit.jupiter.api.Test;

/**
 * @author zhoumin
 */
public class SeatNumber {
    public static String getSeatNo(String seatTypes){
        String seat_no = "";
        int[] carriage_no = new int[16];//假设一列火车16节车厢
        for(int i = 0 ; i < 16;i++ )
            carriage_no[i] = i+1 ;

        if("特等座".equals(seatTypes)){
            //do
            char[] seat = {'A','B','C'};
            int[] row = new int[7];//7排
            for(int i = 0 ; i < 7 ; i++)
                row[i] = i + 1;
            int i =1 + (int) (Math.random() * 7);
            int j =1 +  (int)(Math.random() * 3);
            int k = 1 + (int)(Math.random() * 5);
            seat_no = ""+ carriage_no[k-1] + "车" + row[i-1] + "" + seat[j-1] +"座";
        }else if("一等座".equals(seatTypes) || "二等座".equals(seatTypes)){
            //do
            char[]  seat = {'A','B','C','E','F'};
            int[] row = new int[16];//16排
            int i = 6 + (int) (Math.random() * 10);
            int j = 1 + (int) (Math.random() * 5);
            int k = 1 + (int)(Math.random() * 16);
            seat_no =""+ carriage_no[i-1]+"车"+ row[k-1] + ""+seat[j-1]+"座";
        }else if("硬座".equals(seatTypes)){
            //do
            int[] normal = new int[118];
            for(int i = 0 ; i< 118 ;i ++)
                normal[i] = i+1;
            int i = 6 + (int) (Math.random() * 10);
            int j = 1 + (int) (Math.random() * 118);
            seat_no = carriage_no[i-1]+"车"+normal[j-1]+"号" + "";
        }else if("硬卧".equals(seatTypes) || "软卧".equals(seatTypes)){
            //do
            String[] seat = {"上铺","中铺","下铺"};
            int j = 1 + (int) (Math.random() * 3);
            int i = 1 + (int) (Math.random() * 5);
            seat_no = carriage_no[i-1]+"车"+seat[j-1] + "";

        }else{
            //无座
            int i = 6 + (int) (Math.random() * 10);
            seat_no = carriage_no[i-1]+"车";
        }

        return seat_no;
    }

    @Test
    public void test(){
        System.out.println(getSeatNo("特等座"));
        System.out.println(getSeatNo("硬座"));
        System.out.println(getSeatNo("硬卧"));
        System.out.println(getSeatNo("无座"));
    }
}
