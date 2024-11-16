package view.commands;
import view.View;

public class SortByBirthdate extends Command {

    public SortByBirthdate(View view) {
        super("Sort by birthdate", view);
    }

    @Override
    public void execute(){
        getView().sortByBirthdate();
    }
}
