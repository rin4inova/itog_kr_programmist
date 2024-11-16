package view.commands;
import view.View;

public class PrintCommands extends Command{

    public PrintCommands(View view) {
        super("Print commands", view);
    }

    @Override
    public void execute() {
        getView().printCommands();
    }
}
