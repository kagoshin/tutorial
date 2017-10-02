import org.gradle.api.*

class GreetingPlugin implements Plugin<Project> { // Pluginを実装したカスタムプラグインクラス
    void apply(Project project) { // このプラグインが適用されたときに呼び出されるメソッド
        project.extensions.create("greeting", GreetingExtension) // プロジェクトにgreeting extensionを追加
        project.task("greet") << { // プロジェクトに「greet」タスクを追加
            println "${project.greeting.greeting}, ${project.greeting.target}!"
        }
    }
}

class GreetingExtension {
    String greeting
    String target
    void message(greeting, target) {
        this.greeting = greeting
        this.target = target
    }
}

