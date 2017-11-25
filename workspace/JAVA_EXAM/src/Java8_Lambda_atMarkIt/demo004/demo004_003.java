package Java8_Lambda_atMarkIt.demo004;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class demo004_003 {

    public static void main(String[] args) {
        List<String> list = Arrays.asList("list1", "list2", "list3", "list4", "list5");

        Stream<String> parallelStream1 = list.parallelStream();
        Stream<String> parallelStream2 = list.stream().parallel();

        System.out.println("parallelStream1.isparallel()=" + parallelStream1.isParallel());
        System.out.println("parallelStream2.isparallel()=" + parallelStream2.isParallel());

        Stream<String> sequentialStream = parallelStream1.sequential();
        System.out.println("sequentialStream.isparallel()=" + sequentialStream.isParallel());
    }
}
