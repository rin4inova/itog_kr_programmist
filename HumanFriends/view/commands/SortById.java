package view.commands;

import view.View;

public class SortById extends Command{

    public SortById(View view) {
        super("Sort by id", view);
    }

    @Override
    public void execute(){
        getView().sortById();
    }

}
