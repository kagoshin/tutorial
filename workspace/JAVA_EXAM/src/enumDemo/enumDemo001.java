package enumDemo;

/**
 * enum demo
 * @see Effective Java item:30
 * @author kagoshin
 *
 */
public class enumDemo001 {

    private enum SquareObj {
        NOTEBOOK("notebook", 20, 30, 1),
        BOOK("book", 15, 20, 2),
        DICE("dice", 1, 1, 1);

        private final String name;
        private final int width;
        private final int height;
        private final int depth;

        SquareObj(String name, int width, int height, int depth) {
            this.name = name;
            this.width = width;
            this.height = height;
            this.depth = depth;
        }

        public int calcVolume() {
            return this.width * this.height * this.depth;
        }
    }
    public static void main(String[] args) {

        System.out.println(SquareObj.valueOf("BOOK"));

        for (SquareObj sqObj : SquareObj.values()) {
            System.out.println("Name : " + sqObj.name);
            System.out.println("Volume : " + sqObj.calcVolume());
        }
    }

}
