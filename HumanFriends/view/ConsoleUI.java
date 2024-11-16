package view;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import model.Animals;
import model.member.HumanFriendsMember;
import model.registry.DateBuilder;
import model.registry.HumanFriends;
import presenter.Presenter;

public class ConsoleUI implements View {
    private Scanner scanner;
    private Presenter presenter;
    private boolean check;
    private MainMenu menu;
    private DateBuilder dateBuilder = new DateBuilder();

    public ConsoleUI() {
        scanner = new Scanner(System.in);
        presenter = new Presenter(this);
        check = true;
        menu = new MainMenu(this);
    }

    @Override
    public void start() {
        System.out.println("\nHello!");
        while (check){
            printMenu();
            scanMenu();
        }
    }

    private void printMenu(){
        System.out.println(menu.print());
    }

    private void scanMenu() {
        int maxValue = menu.size();

        while(true){
            String choiceStr = scanner.nextLine();
            try {
                int choice = Integer.parseInt(choiceStr);
                if (choice >= 1 && choice <= maxValue) {
                    menu.execute(choice);
                    break;
                }
            } catch (Exception e) {
                System.out.println("Enter a valid number");
            }
        }
    }

    @Override
    public void answer(String answer) {
        System.out.println(answer);
    }

    public void addHumanFriendsMember() {
        boolean check = true;
        boolean exitConfirmed = false;
        String animalTypeDescription = null;

        System.out.println("Enter name: ");
        String name = scanner.nextLine();

        while(check) {
            System.out.println("Enter animal type:");
            animalTypeDescription = scanner.nextLine();
            if (presenter.checkAnimalTypeDescription(animalTypeDescription)) {
                check = false;
            } else {
                System.out.println("Please enter correct animal type description:");
                answer(presenter.printAnimalTypes());
            }
        }

        System.out.println("Enter birth date: ");
        LocalDate birthdate = dateBuilder.buildDate();
        List<String> commands = new ArrayList<>();

        while (!exitConfirmed) {
            System.out.println("Would you like to enter a command? Y/N");
            String prompt = scanner.nextLine().toLowerCase();
            if(prompt.equals("y")) {
                System.out.println("Type a command: ");
                String newCommand = scanner.nextLine();
                commands.add(newCommand);
            } else if (prompt.equals("n")) {
                exitConfirmed = true;
            } else {
                System.out.println("Please, enter Y or N as a reply");
            }
        }

        presenter.addHumanFriendsMember(animalTypeDescription, name, birthdate, commands);
        presenter.getHumanFriendsRegistryInfo();
    }

    public void exit() {
        boolean exitConfirmed = false;
        int maxRetries = 5;
        int retries = 0;

        while (!exitConfirmed) {
            System.out.println("Would you like to save your changes? Y/N");
            String prompt = scanner.nextLine().toLowerCase();
            if(prompt.equals("y")){
                save();
                exitConfirmed = true;
            } else if (prompt.equals("n")) {
                exitConfirmed = true;
            } else {
                System.out.println("Please, enter Y or N as a reply");
                retries++;
                if (retries > maxRetries) {
                    System.out.println("Maximum retries reached. Exiting without saving.");
                    exitConfirmed = true;
                }
            }
        }

        System.out.println("Bye-bye");
        check = false;
    }

    public void deleteHumanFriendsMember() {
        System.out.println("Enter an id for the animal to delete: ");
        String selectedChoice = scanner.nextLine();
        int animalId = Integer.parseInt(selectedChoice);
        presenter.deleteMember(animalId);
    }

    public void printCommands() {
        System.out.println("Enter an id for the animal:");
        String selectedChoice = scanner.nextLine();
        int animalId = Integer.parseInt(selectedChoice);
        presenter.printCommands(animalId);
    }

    public void addNewCommand() {
        System.out.println("Enter an id for the animal:");
        String selectedChoice = scanner.nextLine();
        int animalId = Integer.parseInt(selectedChoice);
        System.out.println("Enter a command to add:");
        String command = scanner.nextLine();
        presenter.addCommand(animalId, command);
    }

    public void deleteCommand() {
        System.out.println("Enter an id for the animal:");
        String selectedChoice = scanner.nextLine();
        int animalId = Integer.parseInt(selectedChoice);

        HumanFriendsMember selectedMember = null;
        HumanFriends<HumanFriendsMember> humanFriendsRegistry = presenter.getHumanFriendsRegistry();
        Iterator<HumanFriendsMember> iterator = humanFriendsRegistry.iterator();
        while (iterator.hasNext()) {
            HumanFriendsMember member = iterator.next();
            if(member.getId() == animalId) {
                selectedMember = member;
                break;
            }
        }
        answer(selectedMember.getCommands());
        System.out.println("Select an id for the command to delete: ");
        selectedChoice = scanner.nextLine();
        int selectedCommandId = Integer.parseInt(selectedChoice);
        presenter.delecteCommand(selectedMember, selectedCommandId);
    }

    public void countByAnimalType() {
        Animals listOfAnimals = new Animals();
        String selectedAnimalType;
        System.out.println(listOfAnimals.printAnimalTypes());
        System.out.println("Select an animal id to count: ");
        String selectedChoice = scanner.nextLine();
        int animalId = Integer.parseInt(selectedChoice);
        selectedAnimalType = listOfAnimals.getDescriptionByID(animalId);
        presenter.countByAnimalType(selectedAnimalType);
    }

    public void sortByBirthdate() {
        presenter.sortByBirthdate();
    }

    public void sortById() {
        presenter.sortById();
    }

    public void save() {
        presenter.save();
    }

    public void printRegistry() {
        presenter.getHumanFriendsRegistryInfo();
    }

    private HumanFriendsMember selectHumanFriendsMember() {
        boolean myCheck = true;
        boolean flag = false;
        HumanFriendsMember selectedMember = null;
        int animalId = 0;

        System.out.println("Type an animal ID you want to change: ");
        while(myCheck) {
            String selectedChoice = scanner.nextLine();
            try {
                animalId = Integer.parseInt(selectedChoice);
                flag = true;
            } catch (Exception e) {
                System.out.println("Please enter a valid number.");
            }

            if (idExists(animalId)) {
                selectedMember = presenter.getMember(animalId);
                myCheck = false;
            } else if (!idExists(animalId) && flag) {
                System.out.println("There is no animal with the specified id. Choose a valid id.");
            }
        }
        return selectedMember;
    }

    public void changeBirthdate() {
        HumanFriendsMember selectedMember = selectHumanFriendsMember();
        System.out.println("Enter date of birth: ");
        LocalDate birthdate = dateBuilder.buildDate();
        presenter.changeBirthdate(selectedMember, birthdate);
    }

    public void changeName() {
        HumanFriendsMember selectedMember = selectHumanFriendsMember();
        System.out.println("Enter a new name: ");
        String newName = scanner.nextLine();
        presenter.changeName(selectedMember, newName);
    }

    // Check the existence of a HumanFriends ID
    private boolean idExists(int id) {
        HumanFriends<HumanFriendsMember> humanFriendsRegistry = presenter.getHumanFriendsRegistry();
        int[] animalIds = new int[humanFriendsRegistry.getSize()];
        int i = 0;

        for (HumanFriendsMember member: humanFriendsRegistry) {
            animalIds[i++] = member.getId();
        }

        for (int j = 0; j < animalIds.length; j++) {
            if (animalIds[j] == id) {
                return true;
            }
        }
        return false;
    }



}