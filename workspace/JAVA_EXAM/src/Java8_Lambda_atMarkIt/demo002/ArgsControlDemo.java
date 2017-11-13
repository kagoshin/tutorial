package Java8_Lambda_atMarkIt.demo002;

public class ArgsControlDemo {
    private int classField = 0;
    private static int staticField = 0;

    public static void main(String[] args) {
        ArgsControlDemo sample = new ArgsControlDemo();
        sample.process();
    }

    private void process() {
        DoSomethingInterface functionalIf = () -> {
            classField++; // クラス変数の操作は可能
            staticField++; // static変数の操作は可能
        };
        System.out.println("Before: classField = " + classField);
        System.out.println("Before: staticField = " + staticField);

        functionalIf.doSomething();

        System.out.println("After: classField = " + classField);
        System.out.println("After: staticField = " + staticField);
    }

    private void process2() {
        int i = 0;
        DoSomethingInterface functionalIf = () -> {
            //i++; // ローカル変数操作はエラー
            System.out.println("i=" + i); //ローカル変数参照はOK
        };
    }

    @FunctionalInterface
    public interface DoSomethingInterface {
        void doSomething();
    }
}
