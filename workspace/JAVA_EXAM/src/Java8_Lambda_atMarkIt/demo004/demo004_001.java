package Java8_Lambda_atMarkIt.demo004;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class demo004_001 {

    public static void main(String args[]) {
        List<String> list = Arrays.asList("list1", "list2", "list3", "list4", "list5");
        String[] array = {"配列1", "配列2", "配列3", "配列4", "配列5"};

        Stream<String> stream1 = list.stream();
        Stream<String> stream2 = Arrays.stream(array);
        Stream<String> stream3 = Stream.of("１", "２", "３", "４", "５");
        Stream<String> stream4 = Stream.of(array);

        stream1.forEach(e -> System.out.println("stream1:" + e));
        stream2.forEach(e -> System.out.println("stream2:" + e));
        stream3.forEach(e -> System.out.println("stream3:" + e));
        stream4.forEach(e -> System.out.println("stream4:" + e));

        int[] intArray = {1, 2, 3, 4, 5};
        Integer[] integerArray = {1, 2, 3, 4, 5};
        IntStream intArrayStream = Arrays.stream(intArray);
        Stream<Integer> integerArrayStream = Arrays.stream(integerArray);
    }
}
