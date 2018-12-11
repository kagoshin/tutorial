package effectiveJava.ch02.item_005;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Person {
    private Date birthDate;
    private static final Date BOOM_START;
    private static final Date BOOM_END;

    public Date getBirthDate() {
        return birthDate;
    }
    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    static {
        Calendar gmtCal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        gmtCal.set(1946, Calendar.JANUARY, 1, 0, 0, 0);
        BOOM_START = gmtCal.getTime();
        gmtCal.set(1965, Calendar.JANUARY, 1, 0, 0, 0);
        BOOM_END = gmtCal.getTime();
    }

    public boolean isBabyBoomer() {
        return birthDate.compareTo(BOOM_START) >= 0 &&
                birthDate.compareTo(BOOM_END) < 0;
    }
    public static void main(String[] args) {
        Calendar gmtCal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        gmtCal.set(1981, Calendar.FEBRUARY, 1, 0, 0, 0);
        Person person = new Person();
        person.setBirthDate(gmtCal.getTime());
        System.out.println(person.isBabyBoomer());
    }

}
