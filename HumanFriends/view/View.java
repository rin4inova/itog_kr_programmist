package view;

public interface View {
    void start();
    void answer(String answer);
    void printRegistry();
    void addHumanFriendsMember();
    void deleteHumanFriendsMember();
    void printCommands();
    void addNewCommand();
    void deleteCommand();
    void sortByBirthdate();
    void sortById();
    void countByAnimalType();
    void changeBirthdate();
    void changeName();
    void exit();
}
