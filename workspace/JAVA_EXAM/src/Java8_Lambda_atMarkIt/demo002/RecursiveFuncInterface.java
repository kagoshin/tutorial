package Java8_Lambda_atMarkIt.demo002;

/**
 * http://www.atmarkit.co.jp/ait/articles/1403/17/news105_3.html
 * @author kagoshin
 *
 */
public class RecursiveFuncInterface {

    private IntToStringInterface funcInterface;

    public static void main(String[] args) {
        RecursiveFuncInterface sample = new RecursiveFuncInterface();
        // value < 10
        sample.process(0);
        // value > 10
        sample.process(11);
    }

    private void process(int args) {
        funcInterface = value -> value < 10 ? funcInterface.convert(++value) : String.valueOf(value);
        System.out.println("結果= " + funcInterface.convert(args));
    }

    @FunctionalInterface
    public interface IntToStringInterface {
        String convert(int value);
    }
}
