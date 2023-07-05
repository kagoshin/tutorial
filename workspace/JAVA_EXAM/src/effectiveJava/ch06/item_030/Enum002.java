package effectiveJava.ch06.item_030;

/**
 * enum demo
 * @see Effective Java item:30
 *
 */
public class Enum002 {

    enum PayrollDay {
        MONDAY(PayType.WEEKDAY),
        TUESDAY(PayType.WEEKDAY),
        WEDNESDAY(PayType.WEEKDAY),
        THURSDAY(PayType.WEEKDAY),
        FRIDAY(PayType.WEEKDAY),
        SATURDAY(PayType.WEEKEND),
        SUNDAY(PayType.WEEKEND);

        private final PayType payType;

        PayrollDay (PayType payType) {
            this.payType = payType;
        }

        double pay(double hoursWorked, double payRate) {
            return payType.pay(hoursWorked, payRate);
        }

        private enum PayType {
            WEEKDAY {
                double overtimePay(double hrs, double payRate) {
                    return hrs <= HOURS_PER_SHIFT ? 0 : (hrs - HOURS_PER_SHIFT) * payRate / 2;
                }
            },
            WEEKEND {
                double overtimePay(double hrs, double payRate) {
                    return hrs * payRate / 2;
                }
            };

            private static final int HOURS_PER_SHIFT = 8;

            abstract double overtimePay(double hrs, double payRate);

            double pay (double hoursWorked, double payRate) {
                double basePay = hoursWorked * payRate;
                return basePay + overtimePay(hoursWorked, payRate);
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(PayrollDay.MONDAY.pay(Double.parseDouble("10"), Double.parseDouble("1000")));
        System.out.println(PayrollDay.SATURDAY.pay(Double.parseDouble("10"), Double.parseDouble("1000")));
    }
}
