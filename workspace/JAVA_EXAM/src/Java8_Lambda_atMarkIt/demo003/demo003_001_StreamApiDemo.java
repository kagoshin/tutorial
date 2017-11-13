package Java8_Lambda_atMarkIt.demo003;

import java.util.Arrays;
import java.util.stream.Stream;

public class demo003_001_StreamApiDemo {

    public static void main(String[] args) {
        String[] values = {"あか","あお","きいろ","みどり","おれんじ"};
        Stream<String> stream = Arrays.stream(values);
        String result = stream.filter(value -> value.contains("あ"))
                .max((v1, v2) -> v1.compareTo(v2))
                .get();
        System.out.println("result = " + result);
    }
}
