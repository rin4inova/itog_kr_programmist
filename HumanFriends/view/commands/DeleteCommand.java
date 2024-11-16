package view.commands;
import view.View;

public class DeleteCommand extends Command {

    public DeleteCommand (View view) {
        super("Delete command", view);
    }

    @Override
    public void execute() {
        getView().deleteCommand();
    }
}