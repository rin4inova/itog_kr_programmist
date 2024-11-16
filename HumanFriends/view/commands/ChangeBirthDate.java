package view.commands;

import view.View;

public class ChangeBirthDate extends Command {

    public ChangeBirthDate(View view) {
        super("Change birth date", view);
    }

    @Override
    public void execute() {
        getView().changeBirthdate();
    }

}
