package Java8_Lambda_atMarkIt.demo004;

import java.util.ArrayList;
import java.util.List;

public class Person {

    private String name;

    private List<String> children = new ArrayList<>();

    public Person(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void addChild(String name) {
        children.add(name);
    }

    public List<String> getChildren() {
        return children;
    }
}
