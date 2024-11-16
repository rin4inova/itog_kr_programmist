package view;
import java.util.ArrayList;
import java.util.List;

import view.commands.AddCommand;
import view.commands.AddHumanFriendsMember;
import view.commands.ChangeBirthDate;
import view.commands.ChangeName;
import view.commands.Command;
import view.commands.CountByAnimalType;
import view.commands.DeleteCommand;
import view.commands.DeleteHumanFriendsMember;
import view.commands.Exit;
import view.commands.PrintCommands;
import view.commands.PrintRegistry;
import view.commands.SortByBirthdate;
import view.commands.SortById;

public class MainMenu {
    private List<Command> commandsList;

    public MainMenu(View view) {
        commandsList = new ArrayList<>();
        commandsList.add(new PrintRegistry(view));
        commandsList.add(new AddHumanFriendsMember(view));
        commandsList.add(new DeleteHumanFriendsMember(view));
        commandsList.add(new PrintCommands(view));
        commandsList.add(new AddCommand(view));
        commandsList.add(new DeleteCommand(view));
        commandsList.add(new SortByBirthdate(view));
        commandsList.add(new SortById(view));
        commandsList.add(new CountByAnimalType(view));
        commandsList.add(new ChangeBirthDate(view));
        commandsList.add(new ChangeName(view));
        commandsList.add(new Exit(view));
    }

    public String print(){
        StringBuilder sb = new StringBuilder();
        sb.append("\nList of commands:\n");
        for (int i = 0; i < commandsList.size(); i++) {
            sb.append(String.format("%02d", (i + 1)))
                    .append(". ")
                    .append(commandsList.get(i).getDescription())
                    .append("\n");
        }
        return sb.toString();
    }

    public void execute(int choice){
        Command command = commandsList.get(choice - 1);
        command.execute();
    }

    public int size(){
        return commandsList.size();
    }
}