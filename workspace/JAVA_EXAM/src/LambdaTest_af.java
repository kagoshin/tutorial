import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

public class LambdaTest_af {
    public static void main(String[] args) {
        List<String> strs = Arrays.asList("hoge", "fuga", "bar");
        // strs.forEach(str -> System.out.println(str));
        Consumer<String> cons = str -> System.out.println(str);
        strs.forEach(cons);
    }
}
