package Java8_Lambda_atMarkIt.demo002;

import java.math.BigDecimal;

public class CalcInterfaceDemo {

    public static void main(String[] args) {
        //        CalcInterFace calcIf = (value1, value2) -> {
        //            return value1.add(value2);
        //        };
        //        System.out.println(calcIf.calc(new BigDecimal(1), new BigDecimal(2)));

        CalcInterFace calcIf = (value1, value2) ->
        (value1 != null && value2 != null) ? value1.add(value2) : BigDecimal.ZERO;

        System.out.println(calcIf.calc(new BigDecimal(1), new BigDecimal(2)));

    }

    @FunctionalInterface
    public interface CalcInterFace {
        BigDecimal calc(BigDecimal value1, BigDecimal value2);
    }
}
