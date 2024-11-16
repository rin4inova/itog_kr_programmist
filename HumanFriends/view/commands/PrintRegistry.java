package view.commands;
import view.View;

public class PrintRegistry extends Command {

    public PrintRegistry(View view) {
        super("Print registry", view);
    }
    @Override
    public void execute() {
        getView().printRegistry();
    }

}
