package Java8_Lambda_atMarkIt.demo003;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class SalesData {

    private Date date;
    private int salesAmount;
    private String location;

    private static final int[] SALES_AMOUNTS = {
            1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000
    };
    private static final String[] LOCATIONS = {
            "東京", "千葉", "埼玉", "神奈川", "茨城", "栃木", "群馬"
    };

    public SalesData(Date date, int salesAmount, String location) {
        this.date = date;
        this.salesAmount = salesAmount;
        this.location = location;
    }

    public static void main(String[] args) {
        // サンプルデータ作成
        List<SalesData> salesDataList = SalesData.createSalesDateList();

        //        int maxSalesAmount = -1;
        //        for (SalesData salesData : salesDataList) {
        //            if ("東京".equals(salesData.getLocation())) {
        //                if (maxSalesAmount < 0) {
        //                    maxSalesAmount = salesData.getSalesAmount();
        //                } else if (maxSalesAmount < salesData.getSalesAmount()) {
        //                    maxSalesAmount = salesData.getSalesAmount();
        //                }
        //            }
        //        }
        //        int maxSalesAmount = salesDataList.stream()
        int maxSalesAmount = salesDataList.parallelStream()
                .filter(salesData -> "東京".equals(salesData.getLocation()))
                .mapToInt(salesData -> salesData.getSalesAmount())
                .max()
                .getAsInt();
        System.out.println("maxSalesAmount = " + maxSalesAmount);
    }

    public static List<SalesData> createSalesDateList() {
        List<SalesData> salesDataList = new ArrayList<SalesData>();

        // 2014/1/1のDateを生成
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(2014, 1, 1);

        // 1,000,000日分のデータを作成する
        for (int i = 0; i < 1000; i++) {
            Date salesDate = calendar.getTime();
            // 売上金額ごとのデータを作成する
            for (int salesAmount : SALES_AMOUNTS) {
                // 地域ごとのデータを作成する
                for (String location : LOCATIONS) {
                    salesDataList.add(new SalesData(salesDate, salesAmount, location));
                }
            }
            calendar.add(Calendar.DAY_OF_MONTH, 1); // 日付を1日加算
        }
        return salesDataList;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(int salesAmount) {
        this.salesAmount = salesAmount;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
