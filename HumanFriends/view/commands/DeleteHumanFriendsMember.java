package view.commands;
import view.View;

public class DeleteHumanFriendsMember extends Command{
    public DeleteHumanFriendsMember(View view) {
        super("Delete a human friends member", view);
    }

    public void execute() {getView().deleteHumanFriendsMember();}

}