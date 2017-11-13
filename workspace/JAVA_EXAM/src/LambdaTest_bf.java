import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

public class LambdaTest_bf {
    public static void main(String[] args) {
        List<String> strs = Arrays.asList("hoge", "fuga", "bar");
        strs.forEach(new Consumer<String>() {
            @Override
            public void accept(String str) {
                System.out.println(str);
            }
        });
    }
}
