// buildSrc/src/test/groovy/GreetingPluginTests.groovy

import org.junit.Test
import static org.junit.Assert.assertTrue
import org.gradle.api.DefaultTask
import org.gradle.testfixtures.ProjectBuilder

class GreetingPluginTests {
  @Test
  void helloWorldTest() {
    final project = ProjectBuilder.builder().build() // Gradleプロジェクトの作成
    project.apply plugin: GreetingPlugin // テスト対象プラグインの適用
    final task = project.tasks.greet // プラグインによって追加されたタスクの取得

    assertTrue(task instanceof DefaultTask)
  }
}

