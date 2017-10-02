import org.junit.Test
import static org.junit.Assert.assertEquals
import groovy.ui.SystemOutputInterceptor
import org.gradle.testfixtures.ProjectBuilder

class MyTaskTests {
  @Test
  void helloWorldTest() {
    final project = ProjectBuilder.builder().build() // Gradleプロジェクトの作成
    final task = project.task("myTask", type: MyTask) // テスト対象タスクの作成
    task.target = "world" // タスクプロパティの設定

    final actual = getStdOut {
      task.greet() // テスト対象アクションの実行
    }
    assertEquals "Hello, ${task.target}!".toString(), actual
  }

  private static String getStdOut(Closure proc) {
    def stdOut = ""
    final interceptor = new SystemOutputInterceptor({ stdOut += it; false })
    interceptor.start()
    proc()
    interceptor.stop()
    stdOut.trim()
  }
}

