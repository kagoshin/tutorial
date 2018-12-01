package effectiveJava.ch02.item_002;

public class Execute {

    public static void main(String[] args) {
        // 生成
        NutritionFacts cocaCola = new NutritionFacts.Builder(240, 8).calories(100).sodium(35).carbohydrate(27).build();

        System.out.println(cocaCola.getServingSize());
        System.out.println(cocaCola.getServings());
        System.out.println(cocaCola.getCalories());
        System.out.println(cocaCola.getSodium());
        System.out.println(cocaCola.getCarbohydrate());
    }

}
