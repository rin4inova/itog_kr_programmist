package model.member;
import java.time.LocalDate;
import java.time.Period;

public interface HumanFriendsItem {
    String printCommandsList();
    void addNewCommand(String command);
    void deleteCommand(int itemNum);

    String getName();
    Period getAge();
    LocalDate getBirthDate();
    Integer getId();
}
