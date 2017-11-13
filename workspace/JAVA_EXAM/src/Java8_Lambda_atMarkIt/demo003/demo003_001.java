package Java8_Lambda_atMarkIt.demo003;

import java.math.BigDecimal;
import java.util.function.BiConsumer;
import java.util.function.DoublePredicate;
import java.util.function.DoubleToIntFunction;
import java.util.function.LongSupplier;

public class demo003_001 {

    public static void main(String[] args) {

        BiConsumer<String, BigDecimal> biConsumer = (string, bigDecimal) ->
        System.out.println("string=" + string + ", bigDecimal" + bigDecimal);
        biConsumer.accept("テスト", new BigDecimal("0.5"));

        DoublePredicate doublePredicate = (value) -> value > 3.14;
        boolean result1 = doublePredicate.test(2.05);
        System.out.println("doublePredicate.test(2.05) = " + result1);

        LongSupplier longSupplier = () -> System.currentTimeMillis();
        long result2 = longSupplier.getAsLong();
        System.out.println("longSupplier.getAsLong() = " + result2);

        DoubleToIntFunction doubleToIntFunction = (value) -> new BigDecimal(value).intValue();
        int result3 = doubleToIntFunction.applyAsInt(3.14);
        System.out.println("result = " + result3);
    }

}
