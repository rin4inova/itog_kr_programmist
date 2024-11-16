package model.registry;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import model.Animals;
import model.Dogs;
import model.Cats;
import model.Hamsters;
import model.Horses;
import model.Camels;
import model.Donkeys;
import model.member.HumanFriendsMember;

public class HumanFriendsMemberBuilder {
    private Integer id = 1;
    private Integer animalId;
    private String animalDescription;
    private Integer animalTypeId;
    private String animalTypeDescription;
    private String name;
    private LocalDate birthdate;
    private List<String> commands = new ArrayList<String>();

    public void assignID(List<? extends HumanFriendsMember> humanFriendsMembersList){
        int maxID = 0;
        for(HumanFriendsMember member: humanFriendsMembersList){
            if(maxID < member.getId()){
                maxID = member.getId();
            }
        }
        id = maxID + 1;
    }

    public HumanFriendsMember build (String animalTypeDescription, String name, LocalDate birthdate, List<String> commands) {
        String petType;
        Dogs dogs = new Dogs();
        Cats cats = new Cats();
        Hamsters hamsters = new Hamsters();
        Horses horses = new Horses();
        Camels camels = new Camels();
        Donkeys donkeys = new Donkeys();
        Animals animals = new Animals();

        if(checkAnimalTypeDescription(animalTypeDescription)) {

            if(dogs.getPetsList().containsValue(animalTypeDescription)) {
                petType = dogs.getPetType();
            } else if(cats.getPetsList().containsValue(animalTypeDescription)) {
                petType = cats.getPetType();
            } else if(hamsters.getPetsList().containsValue(animalTypeDescription)) {
                petType = hamsters.getPetType();
            } else if(horses.getPackAnimalsList().containsValue(animalTypeDescription)) {
                petType = horses.getPetType();
            } else if(camels.getPackAnimalsList().containsValue(animalTypeDescription)) {
                petType = camels.getPetType();
            } else if(donkeys.getPackAnimalsList().containsValue(animalTypeDescription)) {
                petType = donkeys.getPetType();
            } else {
                throw new IllegalArgumentException("There is no specified animal type");
            }

            animalTypeId = getAnimalTypeId(animalTypeDescription);
            animalId = animals.getIdByDescription(petType);
            animalDescription = animals.getDescriptionByID(animalId);
            this.commands = commands;

            return new HumanFriendsMember(id++, animalTypeId, animalTypeDescription, animalId, animalDescription, name, birthdate, commands);
        } else {
            throw new IllegalArgumentException("There is no specified animal type");
        }
    }

    public Integer getAnimalTypeId (String prompt) {
        Dogs dogs = new Dogs();
        Cats cats = new Cats();
        Hamsters hamsters = new Hamsters();
        Horses horses = new Horses();
        Camels camels = new Camels();
        Donkeys donkeys = new Donkeys();
        Integer idValue = dogs.getID(prompt);

        if(!checkAnimalTypeDescription(prompt)) {
            throw new IllegalArgumentException("There is no specified animal type");
        }

        if(idValue == -1) {
            idValue = cats.getID(prompt);
            if(idValue == -1) {
                idValue = hamsters.getID(prompt);
                if(idValue == -1) {
                    idValue = horses.getID(prompt);
                    if(idValue == -1) {
                        idValue = camels.getID(prompt);
                        if(idValue == -1) {
                            idValue = donkeys.getID(prompt);
                        }
                    }
                }
            }
        }

        return idValue;
    }

    public boolean checkAnimalTypeDescription(String animalTypeDescription) {
        Dogs dogs = new Dogs();
        Cats cats = new Cats();
        Hamsters hamsters = new Hamsters();
        Horses horses = new Horses();
        Camels camels = new Camels();
        Donkeys donkeys = new Donkeys();

        if(dogs.getPetsList().containsValue(animalTypeDescription) || cats.getPetsList().containsValue(animalTypeDescription) || hamsters.getPetsList().containsValue(animalTypeDescription) || horses.getPackAnimalsList().containsValue(animalTypeDescription) || camels.getPackAnimalsList ().containsValue(animalTypeDescription) || donkeys.getPackAnimalsList().containsValue(animalTypeDescription)) {
            return true;
        }
        return false;
    }

    public String printAnimalTypeDescriptions() {
        Dogs dogs = new Dogs();
        Cats cats = new Cats();
        Hamsters hamsters = new Hamsters();
        Horses horses = new Horses();
        Camels camels = new Camels();
        Donkeys donkeys = new Donkeys();
        StringBuilder sb = new StringBuilder();

        sb.append(dogs.printPetTypes()).append(", ").append(cats.printPetTypes()).append(", ").append(hamsters.printPetTypes()).append(", ").append(horses.printPackAnimalTypes()).append(", ").append(camels.printPackAnimalTypes()).append(", ").append(donkeys.printPackAnimalTypes());

        return sb.toString();
    }

}