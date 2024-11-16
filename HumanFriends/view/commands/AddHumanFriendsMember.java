package view.commands;
import view.View;

public class AddHumanFriendsMember extends Command{
    public AddHumanFriendsMember(View view) {
        super("Add a human friends member", view);
    }

    public void execute() {
        getView().addHumanFriendsMember();
    }
}
