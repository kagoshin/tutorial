package Java8_Lambda_atMarkIt.demo002;

public class SampleInterfaceDemo {

    public static void main(String[] args) {
        SampleInterface sampleIf = (String name) -> {
            System.out.println("Hello, " + name);
        };
        sampleIf.say("テスト 大郎");
    }

    @FunctionalInterface
    private interface SampleInterface {
        public void say(String name);
    }
}
