package Java8_Lambda_atMarkIt.demo004;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class demo004_005 {

    public static void main(String[] args) {

        Person person1 = new Person("サンプル 太郎");
        person1.addChild("サンプル 小太郎");
        person1.addChild("サンプル 小次郎");

        Person person2 = new Person("デモ 花子");
        person2.addChild("デモ 小太郎");
        person2.addChild("デモ 小次郎");

        List<Person> list = new ArrayList<>();
        list.add(person1);
        list.add(person2);

        Stream<String> mapStream = list.stream().map(person -> person.getName());
        mapStream.forEach(name -> System.out.println("map: " + name));

        Stream<String> flatMapStream = list.stream().flatMap(person -> person.getChildren().stream());
        flatMapStream.forEach(child -> System.out.println("flatMap: " + child));
    }
}
