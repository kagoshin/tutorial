package Java8_Lambda_atMarkIt.demo002;

public class MultiFuncInterfaceDemo {

    public static void main(String[] args) {
        GetInterface<DoSomethingInterface> getInterface
            = () -> () -> System.out.println("Hello");

//        GetInterface<DoSomethingInterface> getInterface = () -> {
//            return new DoSomethingInterface() {
//                @Override
//                public void doSomething() {
//                    System.out.println("Hello");
//                }
//            };
//        };

        DoSomethingInterface doSomethingIf = getInterface.get();
        doSomethingIf.doSomething();
    }

    @FunctionalInterface
    public interface DoSomethingInterface {
        void doSomething();
    }

    @FunctionalInterface
    public interface GetInterface<T> {
        T get();
    }
}
