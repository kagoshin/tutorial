package Java8_Lambda_atMarkIt.demo004;

import java.util.stream.Stream;

public class demo004_002 {

    public static void main(String[] args) {
        Stream<String> stream1 = Stream.of("あ", "い", "う", "え", "お");
        Stream<String> stream2 = Stream.of("ア", "イ", "ウ", "エ", "オ");
        Stream<String> stream3 = Stream.of("か", "き", "く", "け", "こ");
        Stream<String> stream4 = Stream.of("カ", "キ", "ク", "ケ", "コ");

        Stream<String> concatStream = Stream.concat(stream1, stream2);
        concatStream.forEach(value -> System.out.println(value));

        Stream<String> parallelStream = stream3.parallel();
        Stream<String> concatStream2 = Stream.concat(parallelStream, stream4);
        concatStream2.forEach(value -> System.out.println(value));
        System.out.println("concatStream.isParallel()=" + concatStream2.isParallel());
    }

}
