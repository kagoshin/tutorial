package fileControl;

import java.io.File;

public class renameFile {

    public static void main(String[] args) {
        File file1 = new File("/Users/kagoshin/tutorial/workspace/JAVA_EXAM/resouceFileCtrl/writeFile.txt");
        File file2 = new File("/Users/kagoshin/tutorial/workspace/JAVA_EXAM/resouceFileCtrl/rename/renameFile.txt");

        try {
            if (file1.renameTo(file2)) {
                System.out.println("success to rename");
            } else {
                System.out.println("fail to rename");
            }
        } catch (SecurityException e) {
            System.out.println("例外が発生しました");
            System.out.println(e);
        } catch (NullPointerException e) {
            System.out.println("例外が発生しました");
            System.out.println(e);
        }
    }
}
