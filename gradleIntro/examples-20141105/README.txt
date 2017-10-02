サンプルコードについて

本サンプルコードは「Gradle徹底入門」に付属するものです。

特に断りがない場合、サンプルコードはJDK 7 / Gradle2.0 向けに作成していますが、章によって前提条件が異なる場合があります。
個別の注意事項に関しては以下を参照してください。

[1章]
サンプルコードはJDK 7 / JDK 8 上の Ant 1.9.4 / Maven 3.2.3 で動作を確認しています。


[2章]
サンプルコードはありません。


[3章]
サンプルコードはJDK 7 / JDK 8 上の Gradle2.0 で動作を確認しています。


[4章]
サンプルコードはJDK 7向けで作成しています。
JDK 8で実行する場合はビルドスクリプトの設定を以下のように変更してください（legacy-prjを除く）。

  //JDK8向け
  sourceCompatibility = 1.8
  targetCompatibility = 1.8


[5章]
個別の注意事項はありません。


[6章]
個別の注意事項はありません。


[7章]
個別の注意事項はありません。


[8章]
サンプルコードはJDK 7向けで作成しています。
JDK 8で実行する場合はビルドスクリプトの設定を以下のように変更してください（book-crudを除く）。

  //JDK8向け
  sourceCompatibility = 1.8
  targetCompatibility = 1.8

・book-crud プロジェクトについて
　このサンプルコードは以下のバージョンで動作します。JDK8に対応していませんので、ご注意ください。
　JDK7, Gradle2.0以上
  Firefox 33.0

　・ユニットテストを実行する場合
　gradle -b unit-build.gradle test

　・インテグレーションテストを実行する場合
  gradle -Penv=integration integrationTest

　・システムテストを実行する場合(※)
　gradle -Penv=functional functionalTest

    (※) テスト終了後にTomcatで例外が発生することがありますが、テストは正常に実施されます。
         この例外はTomcatプラグインの実装に起因するものですが、気になる方は build.gradle を以下のように修正してください。

      task tomcatStop4FunctionalTest(type: com.bmuschko.gradle.tomcat.tasks.TomcatStop) {
          stopPort = tomcatStopPort
          stopKey = tomcatStopKey
          doLast {
              Thread.sleep(1000)
          }
      }

[9章]
サンプルコードはありません。


[10章]
サンプルコードはありません。


[11章]
サンプルコードはJDK 7 / JDK 8 上の Gradle2.0 で動作を確認しています。


[12章]
個別の注意事項はありません。


[13章]
ビルド比較プラグインのサンプルでは Gradle1.12 と Gradle2.0 で動作を確認しています。


[14章]
個別の注意事項はありません。


[Appendix]
Windows環境では
 "警告: Could not open/create prefs root node Software\JavaSoft\Prefs at root 0x80000002. Win dows RegCreateKeyEx(...) returned error code 5."
が出る場合がありますが、サンプルの動作に支障はありません。


以上