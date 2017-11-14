package fileControl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * ファイル書込み
 * @author kagoshin
 * @see <a href="https://qiita.com/BumpeiShimada/items/a293a93027d38da5222a">label</a>
 *
 */
public class writeFile {
    public static void main(String[] args) {
        try {
            File file = new File("/Users/kagoshin/tutorial/workspace/JAVA_EXAM/resouceFileCtrl/writeFile.txt");
            FileWriter fileWriter = new FileWriter(file);

            fileWriter.write("こんにちは\n");
            fileWriter.write("How are you?\n");

            fileWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }

}
