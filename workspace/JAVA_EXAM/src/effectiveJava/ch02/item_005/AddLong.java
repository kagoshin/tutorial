package effectiveJava.ch02.item_005;

/**
 * @author kagoshin
 * @see <a href="https://qiita.com/chihiro/items/870eca6e911fa5cd8e58">オートボクシング、アンボクシング</a>
 */
public class AddLong {

//    public static void main(String[] args) {
//        Long sum = 0L;
//        for (long i = 0; i <= Integer.MAX_VALUE; i++) {
//            sum += i;
//        }
//        System.out.println(sum);
//    }

    public static void main(String[] args) {
        long sum = 0L;
        for (long i = 0; i <= Integer.MAX_VALUE; i++) {
            sum += i;
        }
        System.out.println(sum);
    }
}
