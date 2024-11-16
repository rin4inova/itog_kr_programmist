package view.commands;
import view.View;

public class CountByAnimalType extends Command {

    public CountByAnimalType(View view) {
        super("Count by animal type", view);
    }

    @Override
    public void execute() {
        getView().countByAnimalType();
    }
}
