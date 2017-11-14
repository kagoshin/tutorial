package fileControl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * ファイル読込み
 * @author kagoshin
 * @see <a href="https://qiita.com/BumpeiShimada/items/a293a93027d38da5222a">label</a>
 *
 */
public class readFile {
    public static void main(String[] args) {
        try {
            File file = new File("/Users/kagoshin/tutorial/workspace/JAVA_EXAM/resouceFileCtrl/readFile.txt");
            FileReader fileReader = new FileReader(file);
            int ch;
            while ((ch = fileReader.read()) != -1) {
                System.out.print((char) ch);
            }
            fileReader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println(e);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }
}
