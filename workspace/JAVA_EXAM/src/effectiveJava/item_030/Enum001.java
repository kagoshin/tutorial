package effectiveJava.item_030;


import java.util.HashMap;
import java.util.Map;

/**
 * enum demo
 * @see Effective Java item:30
 *
 */
public class Enum001 {

    public enum Operation {
        PLUS("+") {
            double apply(double x, double y) { return x + y; }
        },
        MINUS("-") {
            double apply(double x, double y) { return x - y; }
        },
        TIMES("*") {
            double apply(double x, double y) { return x * y; }
        },
        DEVIDE("/") {
            double apply(double x, double y) { return x / y; }
        };

        private final String symbol;

        Operation(String symbol) {
            this.symbol = symbol;
        }

        @Override
        public String toString() {
            return symbol;
        }

        private static final Map<String, Operation> stringToEnum = new HashMap<String, Operation>();
        static {
            for (Operation op : values()) {
                stringToEnum.put(op.toString(), op);
            }
        }
        public static Operation fromString(String symbol) {
            return stringToEnum.get(symbol);
        }

        abstract double apply(double x, double y);
    }
    public static void main(String[] args) {
        double x = Double.parseDouble(args[0]);
        double y = Double.parseDouble(args[1]);
        for (Operation op : Operation.values()) {
            System.out.printf("%f %s %f = %f%n", x, op, y, op.apply(x, y));
        }

        System.out.println(Operation.fromString("+"));
    }

}
