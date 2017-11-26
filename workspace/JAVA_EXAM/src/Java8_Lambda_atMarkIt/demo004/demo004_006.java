package Java8_Lambda_atMarkIt.demo004;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class demo004_006 {

    public static void main(String[] args) {
        List<String> list = Arrays.asList(new String[] { "あ", "い", "う", "え", "お", "あ", "い", "う", "え", "お" });

        Stream<String> sortedStream = list.stream().sorted((e1, e2) -> e1.compareTo(e2));

        sortedStream.forEach(e -> System.out.println("sorted: " + e));
    }
}
