package view.commands;

import view.View;

public class ChangeName extends Command{
    public ChangeName(View view) {
        super("Change human friend's name", view);
    }

    @Override
    public void execute () {
        getView().changeName();
    }

}