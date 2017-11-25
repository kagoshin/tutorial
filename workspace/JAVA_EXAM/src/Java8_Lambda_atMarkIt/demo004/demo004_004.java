package Java8_Lambda_atMarkIt.demo004;

import java.util.Arrays;
import java.util.stream.Stream;

public class demo004_004 {

    public static void main(String[] args) {
        Integer[] array = { 1, 2, 3, 4, 5, 1, 2, 3, 4, 5 };

        System.out.println("----- filterメソッド -----");
        Stream<Integer> stream1 = Arrays.stream(array);
        stream1.filter(value -> value % 2 == 0)
                .forEach(value -> System.out.println("filterDtream: " + value));

        System.out.println("----- limitメソッド -----");
        Stream<Integer> stream2 = Arrays.stream(array);
        stream2.parallel()
                .limit(3)
                .forEach(value -> System.out.println("limitStream: " + value));

        System.out.println("----- distinctメソッド -----");
        Stream<Integer> stream3 = Arrays.stream(array);
        stream3.distinct()
                .forEach(value -> System.out.println("distinctStream: " + value));
    }
}
