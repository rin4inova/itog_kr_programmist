package model.member;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class HumanFriendsMember implements Serializable, HumanFriendsItem {
    private Integer id;
    private Integer animalTypeId;
    String animalTypeDescription;
    Integer animalID;
    String animalDescription;
    private String name;
    private LocalDate birthdate;
    private List<String> commands;

    public HumanFriendsMember(
            Integer id,
            Integer animalTypeId,
            String animalTypeDescription,
            Integer animalID,
            String animalDescription,
            String name,
            LocalDate birthdate,
            List<String> commands
    ) {
        this.id = id;
        this.animalTypeId = animalTypeId;
        this.animalTypeDescription = animalTypeDescription;
        this.animalID = animalID;
        this.animalDescription = animalDescription;
        this.name = name;
        this.birthdate = birthdate;
        this.commands = commands;
    }

    public String printCommandsList() {
        StringBuilder sb = new StringBuilder();
        sb.append("Commands: ");
        if(!commands.isEmpty()) {
            for (int i = 0; i < commands.size(); i++) {
                if (i < commands.size() - 1) {
                    sb.append(commands.get(i)).append("; ");
                } else {
                    sb.append(commands.get(i));
                }
            }
        }
        return sb.toString();
    }

    public void addNewCommand(String command) {
        commands.add(command);
    };

    public void deleteCommand(int itemNum){
        commands.remove(itemNum - 1);
    };

    public String getName(){
        return name;
    };

    public void setName(String name) {
        this.name = name;
    }

    public Period getAge(){
        Period period = Period.between(LocalDate.now(), birthdate);
        return period;
    };

    public LocalDate getBirthDate(){
        return birthdate;
    };

    public void setBirthDate(LocalDate birthDate) {
        this.birthdate = birthDate;
    }

    public Integer getId() {
        return id;
    }

    public Integer getAnimalTypeID(){
        return animalTypeId;
    }

    public String getAmimalDescription() {
        return animalDescription;
    }

    @Override
    public String toString() {
        return getInfo();
    }

    public String getInfo () {
        StringBuilder sb = new StringBuilder();
        sb.append("id: ")
                .append(id)
                .append(", animalID: ")
                .append(animalID)
                .append(", animalDescription: ")
                .append(animalDescription)
                .append(", TypeId: ")
                .append(animalTypeId)
                .append(", TypeDescription: ")
                .append(animalTypeDescription)
                .append(", name: ")
                .append(name)
                .append(", birthdate: ")
                .append(birthdate)
                .append(", commands: ")
                .append(getCommands());
        return sb.toString();
    }

    public String getCommands() {
        StringBuilder sb = new StringBuilder();
        int numOfListItems = commands.size();
        String result;

        if(!commands.isEmpty()) {
            sb.append("{");
            for (int i = 0; i < numOfListItems; i++) {
                if(i < numOfListItems - 1) {
                    sb.append(i + 1).append(". ").append(commands.get(i)).append(", ");
                } else {
                    sb.append(i + 1).append(". ").append(commands.get(i)).append("}");
                }
            }
            result = sb.toString();
        } else {
            result = "{}";
        }
        return result;
    }

}